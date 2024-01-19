import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ControllerUserUpdatePassword {
late TextEditingController emailController = TextEditingController();
late TextEditingController NewsPasswordController = TextEditingController();
late TextEditingController re_NewsPasswordController = TextEditingController();
// khởi tạo auth firebase
 final FirebaseAuth auth= FirebaseAuth.instance;
 // khởi tạo cloud firestore firebase
 final FirebaseFirestore firestore=  FirebaseFirestore.instance;
 /// hàm viết gửi email để lấy mật khẩu tạm thời
   Future<void> sendPasswordResetEmail(String email, BuildContext context) async {
    try {
      await auth.sendPasswordResetEmail(email: emailController.text);

      // Gửi email đổi mật khẩu thành công, hiển thị thông báo cho người dùng
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Đã gửi email đổi mật khẩu. Vui lòng kiểm tra hộp thư đến của bạn.'),
        ),
      );
    } catch (e) {
      // Xử lý lỗi nếu có
      print('Lỗi khi gửi email đổi mật khẩu: $e');

      // Hiển thị thông báo lỗi cho người dùng
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Đã xảy ra lỗi. Vui lòng thử lại sau.'),
        ),
      );
    }
  }
  /// hàm sử lý lấy cập nhập mật khẩu 
  Future<void> updatePassword( BuildContext context) async {
    try {
      // Cập nhật mật khẩu mới
      User? user = auth.currentUser;
      if(user!=null){
        // String userId = user.uid;
        await user.updatePassword(NewsPasswordController.text);
        // hàm lấy cập mật dữ liệu về firestore
      //   await firestore.collection('users').doc(userId).update({
      //   'password': NewsPasswordController.text,
      //   // Add any other fields you may want to update
      // });
        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Đã cập nhật mật khẩu thành công.'),
        ),
      );
      }

    } catch (e) {
      // Xử lý lỗi nếu có
      print('Lỗi khi cập nhật mật khẩu: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Đã xảy ra lỗi. Vui lòng thử lại sau.'),
        ),
      );
    }
  }

}