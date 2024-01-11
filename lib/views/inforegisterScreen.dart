import 'package:flutter/material.dart';

class ProfileRegisterScreen extends StatefulWidget {
  const ProfileRegisterScreen({super.key});

  @override
  State<ProfileRegisterScreen> createState() => _ProfileRegisterScreenState();
}

class _ProfileRegisterScreenState extends State<ProfileRegisterScreen> {
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            Form(child:
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                      child: TextFormField(
                        decoration:
                         InputDecoration(
                          labelText: 'tên hiển thị',
                          filled: true,
                          fillColor: Colors.brown[100],
                          border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),                          
                          ),
                         ),
                      ),
                    ),
                    SizedBox(height: 30,),
                    Container(
                    margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "ngày sinh",
                              filled: true,
                              fillColor: Colors.brown[100],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        IconButton(onPressed: (){},
                         icon: Icon(Icons.date_range_outlined, size: 40,)
                    )
                  ],
                ),
               ),
               SizedBox(height: 30,),
                Container(
                      margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                      child: TextFormField(
                        decoration:
                         InputDecoration(
                          labelText: 'mật khẩu',
                          filled: true,
                          fillColor: Colors.brown[100],
                          border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),                          
                          ),
                         ),
                      ),
                    ),
                    SizedBox(height: 30,),
                      Container(
                      margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                      child: TextFormField(
                        decoration:
                         InputDecoration(
                          labelText: 'nhập lại mật khẩu',
                          filled: true,
                          fillColor: Colors.brown[100],
                          border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),                          
                          ),
                         ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    ElevatedButton(onPressed: (){},
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
                 ]  
               ),
              ),
            ],
          ),
      ),
    );
  }
}