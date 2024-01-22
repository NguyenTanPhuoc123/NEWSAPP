  import 'package:cloud_firestore/cloud_firestore.dart';
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
      prefs?.setString('Birthday', '');
      prefs?.setString('gender', '');
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
          print(userCredential.user);
          
          // 
          isLogin = true;
            print("User UID: ${userCredential.user?.uid}");
            print("User DisplayName: ${userCredential.user?.displayName}");
            // đăng nhập thành công chuyển tới màn hình trang chủ của ứng dụng
            //await _loadUserDataFromFirestore(userCredential.user?.uid);
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
          SnackBar(content: Text('Đăng nhập không thành công')),);
      }
    }
    void checkuser (BuildContext context) {
      if(emailController.text.isNotEmpty&& passwordController.text.isNotEmpty){
                ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Email hoặc mật khẩu không chính xác')),);
      }
    }
      // xóa thông tin user 
  Future<void> clearUserData() async {
      prefs = await SharedPreferences.getInstance();
      prefs?.setString('email', '');
      prefs?.setString('password', '');
      prefs?.setString('uid', '');
      prefs?.setString('displayname', '');
    }
  // hàm đăng xuất auth
    Future<void> logout(BuildContext context) async {
      await _auth.signOut();
      await clearUserData();
      
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    }
    // lấy thông tin user 
    Future<User?> getUserInfo() async {
    try {
      User? user = _auth.currentUser;
      return user;
    } catch (e) {
      print('Error getting user info: $e');
      return null;
    }
  }
Future<Map<String, String>?> getLocalUserData() async {
    prefs = await SharedPreferences.getInstance();
    
    String? storedEmail = prefs?.getString('email');
    String? storedUid = prefs?.getString('uid');
    String? storedDisplayName = prefs?.getString('displayName');

    if (storedEmail != null && storedUid != null) {
      return {
        'email': storedEmail,
        'uid': storedUid,
        'displayName': storedDisplayName ?? '',
      };
    } else {
      return null;
    }
  }
  // lấy thông tin user từ firestore 
   Future<Map<String, String>?> getUserInfoFromFirestore(String uid) async {
  try {
    DocumentSnapshot<Map<String, dynamic>> userDoc =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    dynamic genderData = userDoc['gender'];
      String gender = genderData is bool ? (genderData ? 'true' : 'false') : (genderData ?? '');
    if (userDoc.exists) {
      print('User document data: ${userDoc.data()}');
      return {
        'email': userDoc['email'],
        'uid': uid,
        'displayName': userDoc['displayName'] ?? '',
        'birthday': userDoc['birthday'],
        'gender': gender,
      };
    } else {
      print('Người dùng không tồn tại trong Firestore');
      return null;
    }
  } catch (e) {
    print('Lỗi khi lấy dữ liệu người dùng từ Firestore: $e');
    return null;
  }
}
  }