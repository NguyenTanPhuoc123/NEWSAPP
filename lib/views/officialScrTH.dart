import 'package:flutter/material.dart';
import 'package:doandidong/control/ControllerNews.dart';
import 'package:doandidong/model/news.dart';
import 'package:doandidong/views/NewsItem.dart';
import 'package:webfeed/webfeed.dart';

class TongHop extends StatefulWidget {
  const TongHop({super.key});

  @override
  State<TongHop> createState() => _TongHopState();
}

class _TongHopState extends State<TongHop> {
  List<News> listNews =
      List.filled(0, News("", "", "", "", "", ""), growable: true);
  RssFeed feed = RssFeed();

  int currentPage = 0;
  load() async {
    ControllerNews.loadFeed().then((result) {
      if (null == result || result.toString().isEmpty) {
        return;
      }
      setState(() {
        feed = result;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    load();
    ControllerNews.getListNews().then((value) {
      listNews = ControllerNews.listNews;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: listNews.isEmpty
            ? const Column(children: [
                SizedBox(height: 180),
                CircularProgressIndicator(),
              ])
            : ListView.builder(
                scrollDirection: Axis.vertical,
                primary: false,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: listNews.length,
                itemBuilder: (context, index) {
                  return NewsItem(news: listNews[index]);
                }));
  }
}
