import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:doandidong/views/officialScrTH.dart';
import 'package:doandidong/views/officialScrTT.dart';
import 'package:http/http.dart' as http;

class Official extends StatefulWidget {
  const Official({super.key});

  @override
  State<Official> createState() => _OfficialState();
}

class _OfficialState extends State<Official> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
                appBar: AppBar(
                    backgroundColor: Color.fromRGBO(246, 238, 238, 1),
                    bottom: TabBar(
                      tabs: [
                        Tab(text: 'Tổng hợp'),
                        Tab(text: 'Thông tin'),
                      ],
                      indicatorColor: Colors.green[300],
                      unselectedLabelColor: Colors.black,
                      labelColor: Colors.black,
                    ),
                    leading: IconButton(
                        icon: Icon(Icons.arrow_back), onPressed: () {}),
                    title: IconTitleWidget()),
                body: TabBarView(children: [
                  TongHop(),
                  ThongTin(),
                ]))));
  }
}

class IconTitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    imageCache.clear();
    final String imgUrl =
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFTYXM1dAQXVwOZjqfiTSreh0Tp7Neo4wEGg&usqp=CAU';
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(imgUrl), fit: BoxFit.fill)),
        ),
        Text(
          'VTC',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Icon(
          Icons.check_circle_outline_sharp,
          color: Colors.green,
        ),
      ],
    );
  }
}
