import 'package:doandidong/model/source_model.dart';

class Article{
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  Article(this.source,this.author,this.title,this.description,this.url,this.urlToImage,this.publishedAt,this.content);
  factory Article.fromJson(Map<String,dynamic>json){
    return Article(
      Source.fromJson(json['source']),
      json['author'].toString(),
      json['title'].toString(),
      json['description'].toString(),
      json['url'].toString(),
      json['urlToImage']!=null ? json['urlToImage'].toString() : "https://i.ytimg.com/vi/Evzui9wafqk/maxresdefault.jpg",
      json['publishedAt'].toString(),
      json['content'].toString()
    );
  }

}