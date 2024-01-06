import 'dart:convert';

import 'package:doandidong/model/article_model.dart';
import 'package:http/http.dart';
class ApiService{
  final  endPointUrl = "https://newsapi.org/v2/top-headlines?country=us&apiKey=30dc140feda546708e02b2ce6d7c769b";

  Future<List<Article>> getArticles() async{
    Response res = await get(Uri.parse( endPointUrl));
    if (res.statusCode==200) {
      Map<String,dynamic> json = jsonDecode(res.body);
      List<dynamic> body = json['articles'];
      List<Article> listArticles = body.map((item) => Article.fromJson(item)).toList();
      return listArticles;
    }
    else{
      throw("Error, Can't get Articles!");
    }
  }
}

//API KEY: 30dc140feda546708e02b2ce6d7c769b