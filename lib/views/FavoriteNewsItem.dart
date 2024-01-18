import 'package:doandidong/model/News.dart';
import 'package:doandidong/views/NewsDetailScreen.dart';
import 'package:flutter/material.dart';

class FavoriteNewsItem extends StatelessWidget {
  const FavoriteNewsItem({super.key,required this.news});
  final News news;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: InkWell(
          onTap: ()=>Navigator.push(context,MaterialPageRoute(builder: (context) => NewsDetailScreen(news: news))),
          child: Row(
            children: [
              Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(news.urlImage),
                        fit: BoxFit.fill),
                  )),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  news.title,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w500),
                ),
              )
            ],
          )),
    );
    ;
  }
}
