import 'package:doandidong/control/ControllerNews.dart';
import 'package:doandidong/model/news.dart';
import 'package:doandidong/views/FavoriteNewsItem.dart';
import 'package:flutter/material.dart';
import 'NewsDetailScreen.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<News> newsHistorys = [];
  @override
  void initState() {
    super.initState();
    setState(() {
      newsHistorys = ControllerNews.listNews.cast<News>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Danh sách đã thích(${newsHistorys.length})',
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black38,
              )),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.sort_rounded,
                  color: Colors.black38,
                ))
          ],
        ),
        body: newsHistorys.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: newsHistorys.length,
                itemBuilder: (context, index) {
                  return FavoriteNewsItem(news: newsHistorys[index]);
                }));
  }
}
