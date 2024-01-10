import 'package:doandidong/model/video.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart'as xml;
class ControllerVideo{
  static const URL = "https://www.youtube.com/feeds/videos.xml?channel_id=UCpK5nl5llhUL4QKq03qan8g";
  static List<Video> videos = List.filled(0,Video("","",""),growable: true);
  static Future getListVideo() async{
    final response = await http.get(Uri.parse( URL));

    if (response.statusCode == 200) {
      final xmlDocument = xml.XmlDocument.parse(response.body);
      for (var entry in xmlDocument.findAllElements('entry')) {
        var title = entry.findElements('title').first;
        var urlVideo = entry.findElements('yt:videoId').first;
        
        var authors;
        for (var author in xmlDocument.findAllElements('author')) {
          authors = author.findElements('name').first;
        }
        videos.add(Video(title.text, authors.text, urlVideo.text));
      }
    } else {
      throw Exception('Failed to load RSS feed');
    }

  }
}