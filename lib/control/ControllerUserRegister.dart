import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_auth/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class ControllerUserRegister {

  // khởi tạo các controller 
 late TextEditingController passwordController = TextEditingController() ;
 late TextEditingController emailController = TextEditingController();
 late TextEditingController userNameController = TextEditingController() ;
 late TextEditingController re_PaswordController = TextEditingController();
  // khởi tạo các plugin firebase
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // hàm đăng ký tài khoản
  Future <void> RegisterUser (BuildContext context) async {
      try{
          if(checkuser()){
       UserCredential credential = await
       _auth.createUserWithEmailAndPassword(
        email: emailController.text, 
        password: passwordController.text
        );
        await credential.user?.updateProfile(displayName: userNameController.text);
          await _firestore.collection('users').doc(credential.user?.uid).set({
          'email': emailController.text,
          'userName': userNameController.text,
          'password': passwordController.text,
          // Thêm các trường khác tùy ý
          
        });
        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Đăng ký thành công')
        ));
     } else {
              ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('thông tin Đăng KÝ Không hợp lệ')
        ));
     }
    }catch(e)
    // lỗi thông tin đăng ký không thành công
    {
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Đăng Ký không thành công ')
        ));
    }
  }
  /// hàm kiểm tra thông tin đã nhập đúng hay chưa 
  bool checkuser(){
    return emailController.text.isNotEmpty &&
    passwordController.text.isNotEmpty &&
    userNameController.text.isNotEmpty &&
    re_PaswordController.text.isNotEmpty &&
    passwordController.text == re_PaswordController.text ;
  }
  // hàm gửi mã otp tới e mail đăng kí 
  void sendOtpEmail () async{
      // khởi tạo thư viện email_auth guiwir thông báo otp về email 
  EmailAuth emailAuth = EmailAuth(sessionName: "email");
    //EmailAuth.sessionName = "test email ";
   var res = await emailAuth.sendOtp(recipientMail: emailController.text);
   if(res){
    print("send otp ");
   }else {
    print("not send");
   }
  } 

}