import 'dart:math';

import 'package:doandidong/views/heart.dart';
import 'package:doandidong/views/history.dart';
import 'package:doandidong/views/homescreen.dart';
import 'package:doandidong/views/personal_information.dart';
import 'package:flutter/material.dart';

class main_personal extends StatefulWidget {
  const main_personal({super.key});

  @override
  State<main_personal> createState() => _main_personalState();
}

class _main_personalState extends State<main_personal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title:const Text("Cá Nhân",style: TextStyle(
          color: Color.fromRGBO(75, 177, 73, 1),
          fontSize: 24,
          fontWeight: FontWeight.w600
        ),),
         actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.exit_to_app,color: Color.fromRGBO(85, 80, 80, 1)))
        ],
      ),
      body: Container(
             margin: const EdgeInsets.symmetric(vertical: 10),
             decoration: BoxDecoration(
             borderRadius: const BorderRadius.all(Radius.circular(9)),
             border: Border.all(width: 2, color: Colors.white)),
        child:
       Column(
            mainAxisAlignment: MainAxisAlignment.start,
          children:[
           Container(
             color: Colors.pink[100],
             child: Column(
              children: [
               Row(
                children: [
                  const Expanded(
                    flex: 1,
                   child:  Padding(
                     padding: EdgeInsets.all(8.0),
                     child: CircleAvatar(
                     backgroundImage: NetworkImage("https://photo-baomoi.bmcdn.me/w700_r1/2024_01_11_294_48049895/f54db0fedab233ec6aa3.jpg"),
                     radius: 65,
                     ),
                   ),
                  ),
                  Expanded(
                    flex: 2,  
                    child: Column(children: [
                   const Text("USER NAME",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    TextButton(onPressed: (){
                       Navigator.pushReplacement(context,   MaterialPageRoute(
                       builder: (context) => const Screen_pesonal(),
                       ),
                       );
                    }, child: const Text("Xem Thông Tin Cá Nhân",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),)],)
                  ),
                ]
              ),
              const SizedBox(height: 30,),
              Container(
                child: Column(
                  children: [
                    Row(  mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                             Column(children: [
                        IconButton(onPressed: (){}, icon:  const Icon(Icons.folder),iconSize: 55,),
                    const Text("Thư mục",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                    ],),
                    Column(children: [
                      IconButton(onPressed: (){
                         Navigator.pushReplacement(context,   MaterialPageRoute(
                       builder: (context) => const scren_hearst(),
                       ),
                       );
                      }, icon:  const Icon(Icons.heart_broken),iconSize: 55,),
                    const Text("Đã Thích",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                    ],)
                    ],),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                     Column(children: [
                       IconButton(onPressed: (){
                       Navigator.pushReplacement(context,   MaterialPageRoute(
                       builder: (context) => const screen_history(),
                       ),
                       );
                   }, icon:  const Icon(Icons.history),iconSize: 55,),
                    const Text("Theo Dõi",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),

                  ],),
                   Column(
                     children: [
                       IconButton(onPressed: (){}, icon:  const Icon(Icons.list_alt_outlined),iconSize: 55,),
                    const Text("Đang Theo Dõi",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                     ],
                   ),
                    ],)
                  ],),
              )
             ],),
           ),
           const SizedBox(height: 40,),
            Container(
              color: Colors.pink[100],
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
              const Text("Thống Kê Danh Sách Của bạn",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
               Column(children: [          
                      IconButton(onPressed: (){}, icon:  const Icon(Icons.menu_book_rounded),iconSize: 45,),
                const Text("Khám Phá",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                const Text("2.1k",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
               ],),
                Column(children: [
                 IconButton(onPressed: (){}, icon:  const Icon(Icons.heart_broken),iconSize: 45,),
                const Text("Lượt Thích",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                const Text("2.1k",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
               ],),
               Column(children: [
                 IconButton(onPressed: (){}, icon:  const Icon(Icons.list_alt_outlined),iconSize: 45,),
                const Text("Lượt Thích",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                const Text("2.1k",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
               ],)
              ],)
                         ],),
            ),
            const SizedBox(height: 40,),
            Container(
              height: 80,
              color: Colors.pink[100],
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                const Text("Đổi Mật Khẩu",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                 IconButton(onPressed: (){}, icon:  const Icon(Icons.arrow_forward_ios_outlined),iconSize: 22,),
              ]),
            ),
           
        ]),
        
        ),
        bottomNavigationBar:  BottomNavigationBar(
          selectedItemColor: Colors.red[200],
          unselectedItemColor: Colors.grey,
          unselectedLabelStyle: const TextStyle(fontSize: 5,fontWeight: FontWeight.bold),
          items: [
              BottomNavigationBarItem(icon: IconButton(onPressed: (){}, icon: const Icon(Icons.home)),label:"Home"),
               BottomNavigationBarItem(icon: IconButton(onPressed: (){}, icon: const Icon(Icons.video_collection_rounded)),label:"Video"),
              BottomNavigationBarItem(icon: IconButton(onPressed: (){}, icon: const Icon(Icons.notifications)),label:"Thông báo"),
               BottomNavigationBarItem(icon: IconButton(onPressed: (){}, icon: const Icon(Icons.account_box_rounded)),label:"Cá Nhân"),
              ], ),
      );
  }
}
//  Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                    Column(children: [
//                       IconButton(onPressed: (){}, icon:  const Icon(Icons.folder),iconSize: 65,),
//                     const Text("Thư mục",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
//                   ],),
//                     Column(children: [
//                       IconButton(onPressed: (){}, icon:  const Icon(Icons.heart_broken),iconSize: 65,),
//                     const Text("Đã Thích",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
//                   ],),
//               ],),
//                Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
//                   Column(children: [
//                        IconButton(onPressed: (){
//                        Navigator.pushReplacement(context,   MaterialPageRoute(
//                        builder: (context) => const screen_history(),
//                        ),
//                        );
//                    }, icon:  const Icon(Icons.history),iconSize: 65,),
//                     const Text("Theo Dõi",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),

//                   ],),
//                    Column(
//                      children: [
//                        IconButton(onPressed: (){}, icon:  const Icon(Icons.list_alt_outlined),iconSize: 65,),
//                     const Text("Đang Theo Dõi",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),

//                      ],
//                    ),
//               ],),