import 'package:flutter/material.dart';
import 'package:doandidong/model/News.dart';
import 'package:doandidong/views/NewsItem.dart';

class TongHop extends StatefulWidget {
  const TongHop({super.key,required this.listNews});
  final List<News> listNews;
  @override
  State<TongHop> createState() => _TongHopState();
}

class _TongHopState extends State<TongHop> {

  @override
  Widget build(BuildContext context) {
    return widget.listNews.isEmpty?const Center(child: CircularProgressIndicator(),):
      ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: widget.listNews.length,
      itemBuilder: (context,index){
        return NewsItem(news: widget.listNews[index]);
      }
    );
  }
}

