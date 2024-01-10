import 'package:flutter/material.dart';

class Follow extends StatefulWidget {
  const Follow({super.key});

  @override
  State<Follow> createState() => _FollowState();
}

class _FollowState extends State<Follow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.green[300],
            leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
            title: Text('Đang theo dõi'),
            centerTitle: true),
        body: Container(
            child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                        child: Row(children: [
                      Column(children: [
                        Container(
                            margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                            child: CircleAvatar(
                                backgroundImage:
                                    AssetImage(notiList[index].imgUrl)))
                      ]),
                      Text(
                        notiList[index].name,
                        textAlign: TextAlign.start,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                          child: Container(
                        child: IconButton(
                            icon: Icon(Icons.done_all), onPressed: () {}),
                      ))
                    ]));
                  }),
            )
          ],
        )));
  }
}

class Following {
  String name;
  String imgUrl;

  Following(this.name, this.imgUrl);
}

List notiList = [
  Following('ethelmarquis', ''),
  Following('TheMetaBarbie', ''),
  Following('pthchuc2087', ''),
  Following('vutuyetquan', ''),
  Following('L_univers2904', ''),
];
