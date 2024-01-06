import 'package:doandidong/model/article_model.dart';
import 'package:flutter/material.dart';

class NewsDetailsPage extends StatefulWidget {
  const NewsDetailsPage({super.key,required this.article});
  final Article article;
  @override
  State<NewsDetailsPage> createState() => _NewsDetailsPageState();
}

class _NewsDetailsPageState extends State<NewsDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.pop(context);},
        icon: Icon(Icons.arrow_back,color: Colors.grey.shade400,)
        ),
        title: const Text("VNEWS",style: TextStyle(
          color: Color.fromRGBO(75, 177, 73, 1),
          fontSize: 24,
          fontWeight: FontWeight.w600
        ),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: Text(widget.article.title,style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.black
              ),),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10,3,0,5),
              child: Text(widget.article.publishedAt,style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w600
              ),),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10,0,10,10),
              color: Colors.grey[200],
              child: Text(widget.article.description,
              style:  TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.black
              ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10,0,10,5),
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.article.urlToImage),
                  fit: BoxFit.cover
                )
              ),
            ),
             Container(
              margin: const EdgeInsets.fromLTRB(10,0,10,10),
              child: Text(widget.article.content,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.black
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}