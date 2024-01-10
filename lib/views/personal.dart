import 'dart:math';

import 'package:doandidong/views/homescreen.dart';
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
                  Expanded(
                    flex: 1,
                    child:  ClipOval( child: Image.network(
                            'https://via.placeholder.com/150', 
                            fit: BoxFit.cover,
                            width: 100,
                            height: 100,
                          ),)
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
              const SizedBox(height: 50,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 
                children: [
                  IconButton(onPressed: (){}, icon:  const Icon(Icons.folder),iconSize: 85,),
                   IconButton(onPressed: (){}, icon:  const Icon(Icons.heart_broken),iconSize: 85,),
              ],),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
                   IconButton(onPressed: (){}, icon:  const Icon(Icons.history),iconSize: 85,),
                   IconButton(onPressed: (){}, icon:  const Icon(Icons.list_alt_outlined),iconSize: 85,),
              ],),
             ],),
           ),
           const SizedBox(height: 50,),
            Container(
              color: Colors.pink[100],
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
              const Text("Thống Kê Danh Sách Của bạn",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
               Column(children: [          
                      IconButton(onPressed: (){}, icon:  const Icon(Icons.menu_book_rounded),iconSize: 55,),
                const Text("Khám Phá",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                const Text("2.1k",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
               ],),
                Column(children: [
                 IconButton(onPressed: (){}, icon:  const Icon(Icons.heart_broken),iconSize: 55,),
                const Text("Lượt Thích",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                const Text("2.1k",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
               ],),
               Column(children: [
                 IconButton(onPressed: (){}, icon:  const Icon(Icons.list_alt_outlined),iconSize: 55,),
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
                const Text("Đổi Mật Khẩu",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                 IconButton(onPressed: (){}, icon:  const Icon(Icons.arrow_forward_ios_outlined),iconSize: 25,),
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
