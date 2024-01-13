import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('THÔNG BÁO',style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600
          ),),
          centerTitle: true,
        ),
        body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                child: Row(
              children: [
                Column(
                children: [
                  Container(
                      margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      child: CircleAvatar(
          backgroundImage:
              NetworkImage("https://yt3.googleusercontent.com/XTzHGB7Bm3Ph8pipyaV7-UpeQVngLs9PZCNtpZ-T2HYe7380UttfvHUI4c7NYgA1Z1NjcZX-Wm8=s176-c-k-c0x00ffffff-no-rj")))
                ],
                ),
                Column(
                children: [
                  Row(
                    children: [
                      Text(
        notiList[index].name,
        textAlign: TextAlign.start,
        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(notiList[index].description),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 200),
                    child: Text(notiList[index].time,
        textAlign: TextAlign.end,
        style: const TextStyle(color: Colors.grey)),
                  )
                ],
                ),
              ],
            ));
          },
        ));
  }
}

class Notification {
  String name;
  String description;
  String imgUrl;
  String time;

  Notification(this.name, this.description, this.time, this.imgUrl);
}

List notiList = [
  Notification('Báo đời ', 'đã đăng một bài báo mới', '1 giờ trước', ''),
  Notification('Báo đời ', 'đã đăng một bài báo mới', '1 giờ trước', ''),
  Notification('Báo đời ', 'đã đăng một bài báo mới', '1 giờ trước', ''),
  Notification('Báo đời ', 'đã đăng một bài báo mới', '1 giờ trước', ''),
  Notification('Báo đời ', 'đã đăng một bài báo mới', '1 giờ trước', ''),
];
