import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';

class News{
  String title;
  String urlLogo;
  String urlImage;
  List<dynamic> contents;
  String description;
  String author;
  String pushDate;
  String link;
  
  News(this.title,
  this.urlLogo,
  this.contents,
  this.description,
  this.pushDate,
  this.author,
  this.urlImage,
  this.link,
  );

  News.fromJson(Map<dynamic,dynamic> json): title = json['title']??"",
                                           urlLogo = json['urlLogo']??"",
                                           contents = List<dynamic>.from(json['contents']??[])??List.empty(growable: true),
                                           description = json['description']??"",
                                           pushDate=json["pushDate"]?? "",
                                           author = json['author']??"",
                                           urlImage=json["urlImage"]??"",
                                           link=json["link"]??"";
                                           
  Map<String,dynamic> toJson()=>{
    "title": title,
    "urlLogo": urlLogo,
    "contents": contents,
    "description":description,
    "pushDate":pushDate,
    "author":author,
    "urlImage":urlImage,
    "link" : link,
  };
  
}