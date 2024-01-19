import 'package:doandidong/control/ControllerUserRegister.dart';
import 'package:doandidong/views/InfoRegisterScreen.dart';
import 'package:doandidong/views/loginscreen.dart';
import 'package:flutter/material.dart';

class ResgisterScreen extends StatefulWidget {
  const ResgisterScreen({super.key});

  @override
  State<ResgisterScreen> createState() => _ResgisterScreenState();
}

class _ResgisterScreenState extends State<ResgisterScreen> {
  final ControllerUserRegister controller = ControllerUserRegister(); 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                Text("ĐĂNG KÝ",style: TextStyle(fontSize: 40,fontWeight: FontWeight.w500),)
              ],
            ),
            const SizedBox(height: 30),
            Form(
              child:Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(10,0,10,15),
                    child: TextFormField(
                      controller: controller.userNameController,
                      decoration: InputDecoration(
                        labelText: "user name",
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
                      controller:  controller.emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        fillColor: Colors.blueGrey[100],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )
                      ),
                           validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Vui lòng nhập tên người dùng';
                          }
                          return null;
                        },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10,0,10,15),
                    child: TextFormField(
                      controller: controller.passwordController,
                      decoration: InputDecoration(
                        labelText: "password",
                        fillColor: Colors.blueGrey[100],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )
                      ),
                      validator: (value){
                        if(value == null){
                          return 'vui long nhap mat khau';
                        }
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10,0,10,15),
                    child: TextFormField(
                      controller: controller.re_PaswordController,
                      decoration: InputDecoration(
                        labelText: "re-enter password",
                        fillColor: Colors.blueGrey[100],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50,),
            ElevatedButton(onPressed: ( ){
            controller.RegisterUser(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green[400],
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))  
            ),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: const Text("Đăng Ký",
              style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),
              ),
            )
            ),
            const SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Bạn đã có tài khoản? "),
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                  child: Text("Đăng Nhập",style: TextStyle(color: Colors.green[300],fontWeight: FontWeight.w300),),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}