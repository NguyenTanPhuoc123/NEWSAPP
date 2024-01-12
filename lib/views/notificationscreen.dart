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
        body: Container(
            child: Column(children: [
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                    child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image:
                                          NetworkImage(notiList[index].imgUrl),
                                      fit: BoxFit.fill)),
                            )
                          ],
                        ),
                        const SizedBox(width: 5),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  notiList[index].name,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(notiList[index].description),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 200),
                          child: Text(notiList[index].time,
                              textAlign: TextAlign.end,
                              style: const TextStyle(color: Colors.grey)),
                        ),
                      ],
                    )
                  ],
                ));
              },
            ),
          )
        ])),
        );
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
  Notification('Báo đời ', 'đã đăng một bài báo mới', '1 giờ trước',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZnQiD69bG6hrFl6x5vv6wiT3n5Tp_QOaPpfLFJoYgIw&s'),
  Notification('Báo đời ', 'đã đăng một bài báo mới', '1 giờ trước',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZnQiD69bG6hrFl6x5vv6wiT3n5Tp_QOaPpfLFJoYgIw&s'),
  Notification('Báo đời ', 'đã đăng một bài báo mới', '1 giờ trước',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZnQiD69bG6hrFl6x5vv6wiT3n5Tp_QOaPpfLFJoYgIw&s'),
  Notification('Báo đời ', 'đã đăng một bài báo mới', '1 giờ trước',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZnQiD69bG6hrFl6x5vv6wiT3n5Tp_QOaPpfLFJoYgIw&s'),
  Notification('Báo đời ', 'đã đăng một bài báo mới', '1 giờ trước',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZnQiD69bG6hrFl6x5vv6wiT3n5Tp_QOaPpfLFJoYgIw&s'),
];
