import 'package:doandidong/model/article_model.dart';
import 'package:doandidong/views/NewsDetailPage.dart';
import 'package:flutter/material.dart';

class NewsItem extends StatefulWidget {
  const NewsItem({super.key,required this.article});
  final Article article;
  @override
  State<NewsItem> createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsDetailsPage(article: widget.article)));
      },
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
                image: DecorationImage(image: NetworkImage(widget.article.urlToImage),fit: BoxFit.cover),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(18))
              ),
            ),
            Text(widget.article.title,style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600
            ),),
            const SizedBox(height: 10),
            Row(
              children: [
                CircleAvatar(backgroundImage: NetworkImage(widget.article.urlToImage),radius: 12,),
                const SizedBox(width: 3),
                Text(widget.article.source.name,style:const TextStyle(
                  fontSize: 13,
                  color: Color.fromRGBO(146, 141, 141, 1)
                ),),
                
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(widget.article.publishedAt,style: const TextStyle(
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