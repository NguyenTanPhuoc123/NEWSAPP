import 'package:flutter/material.dart';
import 'package:doandidong/views/officialScrTH.dart';
import 'package:doandidong/views/officialScrTT.dart';

class Official extends StatefulWidget {
  const Official({super.key});

  @override
  State<Official> createState() => _OfficialState();
}

class _OfficialState extends State<Official> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
                appBar: AppBar(
                    backgroundColor: Colors.white,
                    bottom: TabBar(
                      tabs: [
                        Tab(text: 'Tổng hợp'),
                        Tab(text: 'Thông tin'),
                      ],
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Container(
        //   margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
        //   child:
        //     CircleAvatar(
        //       backgroundImage: Image.asset('');
        //       )
        //     )
        Text('VTC'),
        Icon(Icons.check_circle_outline_sharp),
      ],
    );
  }
}
