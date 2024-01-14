import 'package:doandidong/model/Video.dart';
import 'package:doandidong/model/news.dart';

class Official{
  String urlLogo;
  String name;
  List<News> listNews;
  String address;
  List<Video> videos;
  String email;
  String phone;
  String website;
  String description;
  Official(this.urlLogo,this.name,this.listNews,this.videos,this.description,this.address,this.email,this.phone,this.website);
}