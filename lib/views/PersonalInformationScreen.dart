import 'package:doandidong/views/PersonalScreen.dart';
import 'package:flutter/material.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({super.key});

  @override
  State<PersonalInformationScreen> createState() => _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
        icon: const Icon(Icons.arrow_back,color: Colors.black38,),
        onPressed: () {
          Navigator.pop(context);
        },
      )),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(height: 50),
          Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://photo-baomoi.bmcdn.me/w700_r1/2024_01_11_294_48049895/f54db0fedab233ec6aa3.jpg"),
                        radius: 70,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(25)
                          ),
                          child: IconButton(
                            onPressed: () {
                              // Sự kiện thêm hình ảnh
                            },
                            icon: const Icon(Icons.camera_alt_rounded,),color: Colors.grey,
                            iconSize: 20,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text("Tên hiển thị",style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18
              ),),
               Text("Username",style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18
              ),),
              IconButton(onPressed: (){}, icon: const Icon(Icons.edit))
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text("Giới tính",style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18
              ),),
              Container(
                child: Row(
                  children: [
                    Radio(
                      value: true,
                      groupValue: true,
                      onChanged: (value){
                        setState(() {
                          
                        });
                      }
                    ),
                    const SizedBox(width: 5,),
                    const Text("Nam",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),)
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Radio(
                      value: false,
                      groupValue: true,
                      onChanged: (value){
                        setState(() {
                          
                        });
                      }
                    ),
                    const SizedBox(width: 5),
                    const Text("Nữ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),)
                  ],
                ),
              )
              
              
            ]
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text("Ngày sinh",style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18
              ),),
              Text("1/1/2024",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
              IconButton(onPressed: (){}, icon: const Icon(Icons.calendar_month))
            ],
          ),
          const SizedBox(height: 15),            
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text("Email",style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18
              ),),
              Text("abc123@gmail.com",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
              
            ],
          ),
          const SizedBox(height: 80),
          ElevatedButton(
            onPressed: (){},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green[400],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
            ),
            child:  Container(
              alignment: Alignment.center,
              width: 100,
              height: 50,
              child:const  Text("Cập nhật",style: TextStyle(
                fontSize: 20,
                color: Colors.white
              ),),
            )
          )
        ],
      )),
    );
  }
}
