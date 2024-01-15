import 'package:doandidong/views/inputnewpasswordscreen.dart';
import 'package:doandidong/views/loginscreen.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
          icon: Icon(Icons.arrow_back), 
          onPressed: () {
            /// chuyển hướng về trang đăng ký
            Navigator.pop(context);
          },
        )
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Form(
              child:Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(10,0,10,15),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Email",
                        fillColor: Colors.blueGrey[100],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Mã xác Nhận",
                              fillColor: Colors.blueGrey[100],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(onPressed: (){},
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.green[400],
                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))  
                        ),
                          child: Container(
                              padding: const EdgeInsets.all(10),
                              child: const Text("Gửi Mã",
                              style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),
                              ),
                            )
                          ),  
                      ],
                    ),
                  ),
                ],
              )
            ),
            const SizedBox(height: 50,),
            ElevatedButton(onPressed: (){
              // chuyển sang màn hình nhập lại mật khẩu 
              Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => InpuNewPassWordScreeen(),
              ),
            );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green[400],
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))  
            ),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: const Text("Đổi Mật Khẩu",
              style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),
              ),
            )
            ),          
          ],
        ),
      ),
    );
  }
}