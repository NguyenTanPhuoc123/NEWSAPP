import 'package:doandidong/views/personal.dart';
import 'package:flutter/material.dart';

class scren_hearst extends StatelessWidget {
  const scren_hearst({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text("Lịch Sử Đã Thích",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.green),),
      leading: IconButton(icon: const Icon(Icons.arrow_back_rounded),
      onPressed: (){
        Navigator.pushReplacement(context,   MaterialPageRoute(
              builder: (context) => const main_personal(),
            ),
            );
      },
      ),
      actions: [
        IconButton(onPressed: (){}, icon: const Icon(Icons.align_vertical_top_outlined))
      ],
      ),
      body: SingleChildScrollView(child: Container(
           margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            color: Colors.grey,
          borderRadius: const BorderRadius.all(Radius.circular(9)),
          border: Border.all(width: 2, color: Colors.blue)),
          child: Row(
            children: [
              Expanded(
            flex: 1,
            child: Container(
              width: 130,
              height: 130,
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(image:NetworkImage( 
                   "https://photo-baomoi.bmcdn.me/w700_r1/2024_01_11_294_48049895/f54db0fedab233ec6aa3.jpg", 
                   ),
                   fit: BoxFit.fill),
              ),
            ),
          ),
           const Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ngày 10/1, Liên hợp quốc (LHQ) một lần nữa cảnh báo tình hìnhđạo tồi tệ tại Dải Gaza khi các cuộc không kích vẫn tiếp diễn, gây thêmnhiều thương vong và hủy hoại không ít cơ sở hạ tầng dân sự quan trọng tại dải đất này",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    Text("12/2/2024",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                  ],)
                ],
              ),
            ),
          ),
            ],
          ),
      )),
    );
  }
  }