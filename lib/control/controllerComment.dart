import 'package:doandidong/control/ControllerUserLogin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:doandidong/model/comment.dart';
import 'package:doandidong/model/user.dart' as CustomUser;

class ControllerComment {
  final ControllerUserLogin controller = ControllerUserLogin();
  final DatabaseReference _commentRef =
      FirebaseDatabase.instance.ref().child('comments');

  // Thêm bình luận mới
  Future<void> addComment(String newsId, Comment comment) async {
    User? user = await controller.getUserInfo();
    if (user != null) {
      await _commentRef.child(newsId).push().set({
        'userId': user.uid,
        'userName': user.displayName,
        'commentDate': comment.time,
        'content': comment.content,
      });
    } else {
      print('Không có người dùng đăng nhập');
    }
  }


  // //Lấy danh sách bình luận
  Stream<List<Comment>> getComments(String newsId) {
    return _commentRef.child(newsId).onValue.map((event) {
      final commentsMap = Map<String, dynamic>.from(
        (event.snapshot.value ?? {}) as Map<dynamic, dynamic>,
      );

      return commentsMap.entries
          .map((entry) {
            final commentData = Map<String, dynamic>.from(entry.value);
            
            return Comment( 
              CustomUser.User(
                commentData['userId'].toString(),
                "",
                "",
                commentData['userName'].toString(),
                "",
                true // Assuming the user is always authenticated
              ),
              commentData['commentDate'],
              commentData['content'],
            );
          })
          .toList();
    });
  }
}
