import 'package:doandidong/model/news.dart';
import 'package:webfeed/webfeed.dart';
import 'package:html/parser.dart' as htmlParser;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
class ControllerNews{
  static const URL = "https://vnexpress.net/rss/tin-xem-nhieu.rss";
  static List<News> listNews = List.filled(0,News("","",List.filled(0,"",growable: true),"","","","",""),growable: true);
 static Future<RssFeed> loadFeed(String url) async{
    try{
      final client = http.Client();
      final res = await client.get(Uri.parse(url));
      return RssFeed.parse(res.body);
    }catch(e){
      throw e;
    }
 }

static getImg(String? description){
    int start = description!.indexOf('img src=');
    int end = description.indexOf('</a>');

  if (start!=-1 && end!=-1) {
      return description.substring(start+9,end-3); 
    }
    else{
      return "https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg";
    }
    
  }
 static Future<void> getListNews(String url) async {

      final feed = await loadFeed(url);
      for (var item in feed.items!) {
        var author = feed.generator;
        var logoUrl = feed.image!.url!=null?feed.image!.url.toString() :"https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg";
        News news = News(
          item.title.toString(),
          logoUrl,
          await getContent(item.link.toString()),
          getDescription(item.description.toString()),
          formatPubDate(item.pubDate),
          author.toString(),
          getImg(item.description),
          item.link.toString()
        );
        listNews.add(news);
      }
      
  }


  static Future<List<String>> getContent(String url) async{
    List<String> contents = List.filled(0,"",growable: true);
    try{
      final res = await http.get(Uri.parse(url));
      if(res.statusCode==200){
        final document = htmlParser.parse(res.body);
        final elements = document.getElementsByClassName("Normal");
          for (var content in elements){
              contents.add(content.text);
              
          }
        
      }
    }catch(e){
      throw e;
      
    }
    return contents;
  }

  static String formatPubDate(DateTime? pubDate){
    return DateFormat("dd/MM/yyyy HH:mm").format(pubDate??DateTime.now());
  }

  static String getDescription(String? descriptionRss){
    int start = descriptionRss!.indexOf('</br>');
  if (start!=-1) {
      return descriptionRss.substring(start+5,descriptionRss.length); 
  }
  return "";
  
  }

}
