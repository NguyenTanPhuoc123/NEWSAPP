import 'package:doandidong/views/ForgotPasswordScreen.dart';
import 'package:doandidong/views/loginscreen.dart';
import 'package:doandidong/views/resgisterscreen.dart';
import 'package:flutter/material.dart';

class InpuNewPassWordScreeen extends StatefulWidget {
  const InpuNewPassWordScreeen({super.key});

  @override
  State<InpuNewPassWordScreeen> createState() => _InpuNewPassWordScreeenState();
}

class _InpuNewPassWordScreeenState extends State<InpuNewPassWordScreeen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
          icon: Icon(Icons.arrow_back), 
          onPressed: () {
            /// chuyển hướng về trang đăng nhập
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ForgotPasswordScreen(),
              ),
            );
          },
        )
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Form(
              child:Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(10,0,10,15),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Nhập Mật Khẩu ",
                        fillColor: Colors.blueGrey[100],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10,0,10,15),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Nhập Lịa Mật Khẩu Mới",
                        fillColor: Colors.blueGrey[100],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )
                      ),
                      obscureText: true,
                      obscuringCharacter: "•",
                    ),
                  )
                ],
              )
            ),
            const SizedBox(height: 50,),
            ElevatedButton(onPressed: (){
              
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green[400],
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))  
            ),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: const Text("Cập Nhật",
              style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),
              ),
            )
            ),
            const SizedBox(height: 40,),
            
          ],
        ),
      ),
    );
  }
}