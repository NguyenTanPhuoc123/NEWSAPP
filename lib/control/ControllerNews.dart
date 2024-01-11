import 'package:doandidong/model/news.dart';
import 'package:webfeed/webfeed.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
class ControllerNews{
  static const URL = "https://vnexpress.net/rss/tin-xem-nhieu.rss";
  static List<News> listNews = List.filled(0,News("","","","","",""),growable: true);
 static Future<RssFeed> loadFeed() async{
    try{
      final client = http.Client();
      final res = await client.get(Uri.parse(URL));
      return RssFeed.parse(res.body);
    }catch(e){
      throw e;
    }
 }

static getImg(String? description){
    int start = description!.indexOf('img src=');
    int end = description!.indexOf('</a>');

  if (start!=-1 && end!=-1) {
      return description?.substring(start+9,end-3); 
    }
    else{
      return "https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg";
    }
    
  }
 static Future<void> getListNews() async {
      final feed = await loadFeed();
      
      for (var item in feed.items!) {
        var author = feed.generator;
        var logoUrl = feed.image!.url!=null?feed.image!.url.toString() :"https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg";
        News news = News(
          item.title.toString(),
          logoUrl,
          "",
          item.pubDate.toString(),
          author.toString(),
          getImg(item.description)
        );
        listNews.add(news);
      }
      
  }

Future<void> openFeed(String url) async{
    if(await canLaunchUrl(Uri.parse(url))){
      await launchUrl(Uri.parse(url),mode: LaunchMode.inAppWebView);
      return;
    }
    
  }

}
