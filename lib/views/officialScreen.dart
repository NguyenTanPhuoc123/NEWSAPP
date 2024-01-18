import 'package:doandidong/control/ControllerNews.dart';
import 'package:doandidong/control/ControllerVideo.dart';
import 'package:doandidong/model/Official.dart';
import 'package:doandidong/model/Video.dart';
import 'package:flutter/material.dart';
import 'package:doandidong/views/IconTitleWidget.dart';
import 'package:doandidong/views/officialScrTH.dart';
import 'package:doandidong/views/officialScrTT.dart';
import 'package:http/http.dart' as http;

class OfficialScreen extends StatefulWidget {
  const OfficialScreen({super.key});

  @override
  State<OfficialScreen> createState() => _OfficialScreenState();
}

class _OfficialScreenState extends State<OfficialScreen> {
  Official official = Official(
      "https://yt3.googleusercontent.com/XTzHGB7Bm3Ph8pipyaV7-UpeQVngLs9PZCNtpZ-T2HYe7380UttfvHUI4c7NYgA1Z1NjcZX-Wm8=s176-c-k-c0x00ffffff-no-rj",
      "VNExpress",
      ControllerNews.listNews,
      ControllerVideo.videos as List<Video>,
      "Truyền hình thông tấn",
      "65 Huỳnh Thúc Kháng, Q.1, TP.HCM",
      "vnexpress@gmail.com",
      "0123456789",
      "www.vnexpress,com");
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
                appBar: AppBar(
                    backgroundColor: const Color.fromRGBO(246, 238, 238, 1),
                    bottom: TabBar(
                      tabs: const [
                        Tab(text: 'Tổng hợp'),
                        Tab(text: 'Thông tin'),
                      ],
                      indicatorColor: Colors.green[300],
                      unselectedLabelColor: Colors.black,
                      labelColor: Colors.black,
                    ),
                    leading: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () => Navigator.pop(context)),
                    title: const IconTitleWidget()),
                body: TabBarView(children: [
                  TongHop(listNews: official.listNews),
                  ThongTin(
                      description: official.description,
                      email: official.email,
                      address: official.address,
                      phone: official.phone,
                      website: official.website),
                ]))));
  }
}
