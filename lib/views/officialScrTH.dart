import 'package:doandidong/model/Official.dart';
import 'package:doandidong/model/Video.dart';
import 'package:flutter/material.dart';
import 'package:doandidong/control/ControllerNews.dart';
import 'package:doandidong/model/news.dart';
import 'package:doandidong/views/NewsItem.dart';
import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart' as http;

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

