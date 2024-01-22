import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doandidong/control/ControllerNews.dart';
import 'package:doandidong/control/ControllerOfficial.dart';
import 'package:doandidong/model/News.dart';
import 'package:doandidong/control/ControllerUserLogin.dart';
import 'package:doandidong/model/User.dart';
import 'package:doandidong/views/AlertDialog.dart';
import 'package:doandidong/views/NewsDetailScreen.dart';
import 'package:doandidong/views/officialScreen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:doandidong/views/HistoryScreen.dart';
import 'package:doandidong/control/ControllerNews.dart';

class NewsItem extends StatefulWidget {
  const NewsItem({Key? key, required this.news, this.onAddedToHistory})
      : super(key: key);
  final News news;
  final Function(News news)? onAddedToHistory;

  @override
  State<NewsItem> createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  int countComment = 12000;
  int countLike = 0;
  bool isFavorite=false;
  User user = User("","","12345678","abc","",true);

  String formatCount(int number) {
    if (number < 10000) {
      return "$number";
    }
    else if(number>=10000 && number<1000000)
    {
      return "${number~/1000}K+";
    }
    else if(number<1000000000)
    {
      return "${number~/1000000}M+";
    }
    else {
      return "1T+";
    }
    
  }

    getCountLike(){
      ControllerNews.getUserLiked(widget.news.title).then((value){
        setState(() {
          countLike = value.length;
        });
      });
      return countLike;
    }

   favorite(){
    if(isFavorite){
      return IconButton(
              onPressed: (){
                  
                  if(ControllerUserLogin.isLogin){
                    setState(() {
                      isFavorite = !isFavorite;
                      ControllerNews.removeNewsFavorite(user.displayName, widget.news);
                    });
                  
                  }
                  else{
                    showDialogLogin(context);
                  }
                  
              },
              icon: FaIcon(FontAwesomeIcons.solidHeart,color: Colors.red[500],size: 16,) 
        );
    }
    return IconButton(
      onPressed: (){
          if(ControllerUserLogin.isLogin){
            setState(() {
              ControllerNews.saveNewsFavorite(user.displayName,widget.news);
            isFavorite = !isFavorite;
            });
            
          }
          else{
            showDialogLogin(context);
          }
      },
      icon: const FaIcon(FontAwesomeIcons.heart,size: 16,) 
      );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ControllerNews.saveNewsRead(user.displayName,widget.news);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetailScreen(news: widget.news),
          ),
        );
        
        // addNewsToHistory(widget.news);
      },
      child: Container(
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: const Color.fromRGBO(246, 238, 238, 1),
            borderRadius: BorderRadius.circular(18)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 130,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.news.urlImage),
                      fit: BoxFit.fill),
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(18))),
            ),
            Container(
              margin: const EdgeInsets.all(3),
              child: Text(
                widget.news.title,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(width: 3),
                InkWell(
                  onTap: () {
                    var official;
                    setState(() {
                      
                      official = ControllerOfficial.getOfficialByName(
                          widget.news.author);
                    });
                    if (official != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  OfficialScreen(official: official)));
                    }
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(widget.news.urlLogo),
                            fit: BoxFit.fill)),
                  ),
                ),
                const SizedBox(width: 3),
                InkWell(
                  onTap: () {
                    var official;
                    setState(() {
                      official = ControllerOfficial.getOfficialByName(
                          widget.news.author);
                    });
                    if (official != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  OfficialScreen(official: official)));
                    }
                  },
                  child: Text(
                    widget.news.author,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
              Expanded(
                child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  favorite(),
                  Text(formatCount(getCountLike()),style:const TextStyle(fontSize: 16),),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    NewsDetailScreen(news: widget.news))),
                        icon: const FaIcon(FontAwesomeIcons.comment, size: 16),
                      ),
                    ])
                  ],
                ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  widget.news.pushDate,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w300),
                ),
                const SizedBox(
                  width: 5,
                )
              ],
            ),
            const SizedBox(
              height: 3,
            )
          ],
        ),
      ),
    );
  }

}
