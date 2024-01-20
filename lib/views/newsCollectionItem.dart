import 'package:doandidong/control/ControllerNews.dart';
import 'package:doandidong/model/news.dart';
import 'package:doandidong/views/NewsDetailScreen.dart';
import 'package:flutter/material.dart';

class NewsCollectionItem extends StatefulWidget {
  const NewsCollectionItem({super.key, required this.news});
  final News news;
  @override
  State<NewsCollectionItem> createState() => _NewsCollectionItemState();
}

class _NewsCollectionItemState extends State<NewsCollectionItem> {
  _removeNews(News news) {
    ControllerNews.removeNewsFromCollection('listNews', news);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NewsDetailScreen(news: widget.news))),
          child: Row(
            children: [
              Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.news.urlImage),
                        fit: BoxFit.fill),
                  )),
              const SizedBox(width: 5),
              Expanded(
                flex: 2,
                child: Text(
                  widget.news.title,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                  child: IconButton(
                onPressed: _removeNews(widget.news),
                icon: const Icon(Icons.delete),
                color: Colors.black38,
              ))
            ],
          )),
    );
  }
}
