import 'package:doandidong/control/ControllerUserLogin.dart';
import 'package:doandidong/views/ForgotPasswordScreen.dart';
import 'package:doandidong/views/resgisterscreen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ControllerUserLogin controller = ControllerUserLogin();
   
    @override
  void initState() {
    super.initState();
    controller.loadUserData(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('VNEWS',style: TextStyle(
          color:Colors.green[400],
          fontSize: 32,
          fontWeight: FontWeight.w400
        ),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("ĐĂNG NHẬP",style: TextStyle(fontSize: 40,fontWeight: FontWeight.w500),)
              ],
            ),
            const SizedBox(height: 30),
            Form(
              child:Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(10,0,10,15),
                    child: TextFormField(
                      controller: controller.emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        fillColor: Colors.blueGrey[100],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10,0,10,15),
                    child: TextFormField(
                      controller: controller.passwordController,
                      decoration: InputDecoration(
                        labelText: "Mật khẩu",
                        fillColor: Colors.blueGrey[100],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )
                      ),
                      validator: (value){
                        if(value==null && controller.passwordController.text.isEmpty){
                          return 'khong duoc bo trong email';
                        }
                      },
                      obscureText: true,
                      obscuringCharacter: "•",
                    ),
                  )
                ],
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  child: Text("Quên mật khẩu",style: TextStyle(color: Colors.green[300]),),
                  onTap: (){
                    // chuyển hướng sang màn hình forgotpassword 
                    Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ForgotPasswordScreen(),
                    ),
                  );
                  },
                ),
                const SizedBox(width: 20)
              ],
            ),
            const SizedBox(height: 50,),
            ElevatedButton(onPressed: (){
              // sự kiện sử lí đăng nhập  
              controller.loginUser(context);
              
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green[400],
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))  
            ),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: const Text("Đăng nhập",
              style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),
              ),
            )
            ),
            const SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Bạn chưa có tài khoản? "),
                InkWell(
                  onTap: (){
                    // chuyển sang màn hình đăng ký
                    Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResgisterScreen(),
                    ),
                  );
                  },
                  child: Text("Đăng ký",style: TextStyle(color: Colors.green[300],fontWeight: FontWeight.w300),),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}