import 'package:firebase_auth/firebase_auth.dart';
class ControllerUser{
 // khởi tại firebase auth
final FirebaseAuth auth = FirebaseAuth.instance;
// ham lay thong tin ca nhan 
 Future<User?> getCurrentUser() async {
    try {
      UserCredential userCredential = await auth.signInAnonymously(); // Đăng nhập ẩn danh (có thể thay đổi phương thức đăng nhập tùy thuộc vào ứng dụng của bạn)
      User? user = userCredential.user;
      return user;
    } catch (e) {
      print("Lỗi đăng nhập: $e");
      return null;
    }
  }

  

}
