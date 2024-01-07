import 'package:doandidong/control/ControllerNews.dart';
import 'package:flutter/material.dart';
import 'package:webfeed/webfeed.dart';

class NewsItem extends StatefulWidget {
  const NewsItem({super.key,required this.feed,required this.item,required this.controllerNews});
  final RssFeed feed;
  final RssItem item;
  final ControllerNews controllerNews;
  @override
  State<NewsItem> createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> widget.controllerNews.openFeed(widget.item.link.toString()),
      child: Container(
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Color.fromRGBO(246, 238, 238, 1),
          borderRadius: BorderRadius.circular(18)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, 
          crossAxisAlignment: CrossAxisAlignment.start,         
          children: [
            Container(
              height: 130,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(widget.controllerNews.getImg(widget.item.description)),fit: BoxFit.fill),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(18))
              ),
            ),
            Container(
              margin: const EdgeInsets.all(3),
              child: Text(widget.item.title.toString(),style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600
              ),),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(width: 3),
                Container(
                  width: 30,height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: NetworkImage(widget.feed.image!.url.toString()),fit: BoxFit.fill)
                  ),
                ),
                const SizedBox(width: 3),
                Text(widget.feed.generator.toString(),style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600
                ),
              )
                
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(widget.item.pubDate.toString(),style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300
                ),),
                const SizedBox(width: 5,)
              ],
            ),
            const SizedBox(height: 3,)
          ],
        ),
      ),
    );
  }
}