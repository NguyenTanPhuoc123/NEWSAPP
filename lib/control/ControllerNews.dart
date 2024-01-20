import 'package:doandidong/model/News.dart';
import 'package:webfeed/webfeed.dart';
import 'package:html/parser.dart' as htmlParser;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
class ControllerNews{
  static late SharedPreferences preferences;
  static List<News> listNews = List.filled(0,News("","",List.filled(0,"",growable: true),"","","","",""),growable: true);
  static List<News> listNewsCollection = List.filled(0,News("","",List.empty(),"","","","",""),growable: true);
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
    int start = description!.indexOf('src=');
    int end = description.indexOf('"></a>');
    int end2 = description.indexOf('" ></a>');
    
  if (start!=-1 && end2!=-1) {
      return description.substring(start+5,end2); 
  }
  else if(start!=-1 && end!=-1){
    return description.substring(start+9,end);
  }
    else{
      return "https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg";
    }
    
  }
 static Future<void> getListNews(String url) async {
      final feed = await loadFeed(url);
      for (var item in feed.items!) {
        var author = getAuthor(feed.generator.toString());
        var logoUrl = feed.image!.url!=null?feed.image!.url.toString() :"https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg";
        print(item.title.toString());
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

  static getAuthor(String author){
    int start = author.indexOf('https://');

  if (start!=-1) {
      return author.substring(start+8); 
  }
  else{
      return author;
  }
    
  }

  static Future<void> getListAllNews(List<String> url) async{
    for (var urlFeed in url) {
      final feed = await loadFeed(urlFeed);
      for (var item in feed.items!) {
        var author = getAuthor(feed.generator.toString());
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
  }

  static List<News> getListNewsByOfficial(String official){
      List<News> listNewsByOfficial = List.filled(0,News("","",List.empty(),"","","","",""),growable: true);
      
      for (var news in listNews) {
        if(news.author.compareTo(official)==0){
          listNewsByOfficial.add(news);
        }
      }
      return listNewsByOfficial;
  }

  static Future<List<String>> getContent(String url) async{
    List<String> contents = List.filled(0,"",growable: true);
    try{
      final res = await http.get(Uri.parse(url));
      if(res.statusCode==200){
        final document = htmlParser.parse(res.body);
        final elements = document.getElementsByClassName("Normal");
        if (elements.isNotEmpty) {
            for (var content in elements){
              contents.add(content.text);    
          }
        }
        else{
          var lst = document.getElementsByClassName('edittor-content box-cont mt15 clearfix');
          for (var element in lst) {
          var lstcontent =  element.querySelectorAll('p'); 
            contents = lstcontent.map((content) => content.text).toList(); 
        }
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
    int end   = descriptionRss.lastIndexOf(' ]]>');
  if (start!=-1 && end!=-1) {
      return descriptionRss.substring(start+5,end); 
  }
  else if(start!=-1 && end==-1){
    return descriptionRss.substring(start+5,descriptionRss.length);
  }
  
  return "";
  
  }
  
  static Future<void> init() async{
    preferences = await SharedPreferences.getInstance();
  }

  static loadListNewsFromJson(String key){
      List<String>? lst = preferences.getStringList(key);
      listNewsCollection = lst?.map((news)=> News.fromJson(json.decode(news))).toList() ?? [];
  }

  static Future<void> addNewsToCollection(String key,News news) async{
    listNewsCollection.add(news);
    final jsonString = listNewsCollection.map((e) => jsonEncode(e.toJson())).toList();
    await preferences.setStringList(key,jsonString);
  }

  static Future<void> removeNewsFromCollection(String key,News news) async{
    listNewsCollection.removeWhere((element) => element == news);
    final jsonString = listNewsCollection.map((e) => jsonEncode(e.toJson())).toList();
    await preferences.setStringList(key,jsonString);
  }
}

