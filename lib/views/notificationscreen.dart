import 'package:flutter/material.dart';

class Noti extends StatefulWidget {
  const Noti({super.key});

  @override
  State<Noti> createState() => _NotiState();
}

class _NotiState extends State<Noti> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[300],
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
          title: Text('Thông báo'),
        ),
        body: Container(
            child: Column(children: [
          Expanded(
            child: ListView.builder(
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
                                    AssetImage(notiList[index].imgUrl)))
                      ],
                    ),
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
                        Container(
                          margin: EdgeInsets.only(left: 200),
                          child: Text(notiList[index].time,
                              textAlign: TextAlign.end,
                              style: const TextStyle(color: Colors.grey)),
                        )
                      ],
                    ),
                  ],
                ));
              },
            ),
          )
        ])));
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
