import 'package:doandidong/views/personal.dart';
import 'package:flutter/material.dart';

class Screen_pesonal extends StatefulWidget {
  const Screen_pesonal({super.key});

  @override
  State<Screen_pesonal> createState() => _Screen_pesonalState();
}

class _Screen_pesonalState extends State<Screen_pesonal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        icon: const Icon(Icons.arrow_back_rounded),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const main_personal(),
            ),
          );
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
                        radius: 90,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: IconButton(
                          onPressed: () {
                            // Sự kiện thêm hình ảnh
                          },
                          icon: const Icon(Icons.camera_alt_rounded,),color: Colors.grey,
                          iconSize: 45,
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
          Positioned(
              top: 150,
              left: 20,
              right: 20,
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Tên Hiển Thị",
                    fillColor: Colors.blueGrey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    suffixIcon: const Icon(Icons.border_color_rounded)),
              )),
          const SizedBox(
            height: 20,
          ),
          Positioned(
              top: 150,
              left: 20,
              right: 20,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Giới tính",
                  fillColor: Colors.blueGrey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              )),
          const SizedBox(
            height: 20,
          ),
          Positioned(
              top: 150,
              left: 20,
              right: 20,
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Ngày sinh",
                    fillColor: Colors.blueGrey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    suffixIcon: const Icon(Icons.date_range_outlined)),
              )),
          const SizedBox(
            height: 20,
          ),
          Positioned(
              top: 150,
              left: 20,
              right: 20,
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Email",
                    fillColor: Colors.blueGrey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    suffixIcon: const Icon(Icons.email_outlined)),
              )),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Xử lý dữ liệu khi nhấn nút Lưu
            },
            child: const Text('Lưu'),
            
          ),
        ],
      )),
    );
  }
}
