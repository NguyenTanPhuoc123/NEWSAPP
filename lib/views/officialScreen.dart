import 'package:doandidong/control/ControllerNews.dart';
import 'package:doandidong/control/ControllerOfficial.dart';
import 'package:doandidong/model/Official.dart';
import 'package:flutter/material.dart';
import 'package:doandidong/views/officialScrTH.dart';
import 'package:doandidong/views/officialScrTT.dart';

class OfficialScreen extends StatefulWidget {
  const OfficialScreen({super.key, required this.official});
  final Official official;
  @override
  State<OfficialScreen> createState() => _OfficialScreenState();
}

class _OfficialScreenState extends State<OfficialScreen> {
  late bool status;

  @override
  void initState() {
    super.initState();
    setState(() {
      status = ControllerOfficial.isFollowing(widget.official);
    });
  }

  iconFollowing() {
    if (status == true) {
      return IconButton(
          onPressed: () {
            setState(() {
              ControllerOfficial.removeUserForChannel(widget.official);
              status = false;
            });
          },
          icon: const Icon(
            Icons.check_circle_outline_sharp,
            color: Colors.green,
          ));
    } else {
      return IconButton(
          onPressed: () {
            setState(() {
              ControllerOfficial.addUserForChannel(widget.official);
              status = true;
            });
          },
          icon: const Icon(
            Icons.add_circle_outline,
            color: Colors.green,
          ));
    }
  }

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
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(widget.official.urlLogo),
                                fit: BoxFit.fill)),
                      ),
                      Text(
                        widget.official.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      iconFollowing()
                    ],
                  ),
                ),
                body: TabBarView(children: [
                  TongHop(
                      listNews: ControllerNews.getListNewsByOfficial(
                          widget.official.name)),
                  ThongTin(
                      description: widget.official.description,
                      email: widget.official.email,
                      address: widget.official.address,
                      phone: widget.official.phone,
                      website: widget.official.website),
                ]))));
  }
}
