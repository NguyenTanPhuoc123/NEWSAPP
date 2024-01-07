import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:webfeed/webfeed.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
class ControllerNews{
  static const URL = "https://vnexpress.net/rss/tin-xem-nhieu.rss";
  static const String loadingFeedMsg = "Loading...";
  static const String loadingErrorMsg = "Error loading Feed.";
  static const String feedOnpenErrorMsg = "Error open Feed.";


 Future<RssFeed> loadFeed() async{
    try{
      final client = http.Client();
      final res = await client.get(Uri.parse(URL));
      return RssFeed.parse(res.body);
    }catch(e){
      throw e;
    }
  }

 

getImg(String? description){
    int start = description!.indexOf('img src=');
    int end = description!.indexOf('</a>');

  if (start!=-1 && end!=-1) {
      return description?.substring(start+9,end-3); 
    }
    else{
      return "https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg";
    }
    
  }


isFeedEmpty(feed){
    return null == feed || null == feed.items;
  }

Future<void> openFeed(String url) async{
    if(await canLaunchUrl(Uri.parse(url))){
      await launchUrl(Uri.parse(url),mode: LaunchMode.inAppWebView);
      return;
    }
    
  }

}