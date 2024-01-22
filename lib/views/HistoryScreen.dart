import 'package:doandidong/control/ControllerNews.dart';
import 'package:doandidong/model/News.dart';
import 'package:doandidong/model/user.dart';
import 'package:doandidong/views/FavoriteNewsItem.dart';
import 'package:flutter/material.dart';


class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key,required this.user});
  final User user;
  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<News> listNews = List.filled(0,News("","",List.empty(growable: true),"","","","",""),growable: true);
  
  @override
  void initState() {
    super.initState();
    ControllerNews.getListNewsRead(widget.user.uid).then((value){
      setState(() {
        listNews = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'LỊCH SỬ ĐỌC(${listNews.length})',
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black38,
              )),
          
        ),
        body: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: listNews.length,
            itemBuilder: (context, index) {
              return FavoriteNewsItem(news: listNews[index]);
            }));
  }

}
