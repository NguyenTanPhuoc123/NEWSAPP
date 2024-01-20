import 'package:doandidong/views/LoginScreen.dart';
import 'package:doandidong/views/MainScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ControllerUserLogin  {
  static bool isLogin= false;
 late TextEditingController passwordController = TextEditingController() ;
 late TextEditingController emailController = TextEditingController();
 // khởi tạo xác thực firebase 
    FirebaseAuth _auth = FirebaseAuth.instance;
  // khởi tạo lưu trữ người dùng về local
   SharedPreferences? prefs ;
  //load user đăng hập vào app
Future<void> loadUserData(BuildContext context) async {
  prefs = await SharedPreferences.getInstance();
  String? storedEmail = prefs?.getString('email');
  String? storedPassword = prefs?.getString('password');

  if (storedEmail != null && storedPassword != null) {
    emailController.text = storedEmail;
    passwordController.text = storedPassword;
    // Tự động đăng nhập nếu có thông tin đăng nhập đã lưu
    loginUser(context);
  }
}
  // lưu thông tin user đăng nhập 
  _saveUserData(User user){
    prefs?.setString('email', emailController.text);
    prefs?.setString('password', passwordController.text);
        prefs?.setString('uid', user.uid);
    prefs?.setString('displayName', user.displayName ?? '');
  }

  //hàm đăng nhập user bằng auth của firebase 
  Future <void> loginUser (BuildContext context) async {
     try{
        UserCredential userCredential = await _auth
        .signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text
          );
         _saveUserData(userCredential.user!);
         
         // 
         isLogin = true;
          print("User UID: ${userCredential.user?.uid}");
          print("User DisplayName: ${userCredential.user?.displayName}");
          // đăng nhập thành công chuyển tới màn hình trang chủ của ứng dụng
          Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MainScreen(),
        )
          );
          ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Đăng nhập thành công')
          
        ));
     }catch(e)
     {
        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(' đăng nhập không thành công')),);
     }
  }
  void checkuser (BuildContext context) {
    if(emailController.text.isNotEmpty&& passwordController.text.isNotEmpty){
              ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('email hoặc mật khảu bị sai')),);
    }
  }
    // xóa thông tin user 
 Future<void> clearUserData() async {
    prefs = await SharedPreferences.getInstance();
    prefs?.setString('email', '');
    prefs?.setString('password', '');
  }
// hàm đăng xuất auth
  Future<void> logout(BuildContext context) async {
    await _auth.signOut();
    clearUserData();
    
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }
  // lấy thông tin user 

}