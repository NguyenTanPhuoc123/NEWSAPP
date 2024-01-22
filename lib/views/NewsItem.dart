import 'package:doandidong/control/ControllerNews.dart';
import 'package:doandidong/control/ControllerOfficial.dart';
import 'package:doandidong/model/News.dart';
import 'package:doandidong/control/ControllerUserLogin.dart';
import 'package:doandidong/model/user.dart';
import 'package:doandidong/views/AlertDialog.dart';
import 'package:doandidong/views/NewsDetailScreen.dart';
import 'package:doandidong/views/officialScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';

class NewsItem extends StatefulWidget {
  const NewsItem({super.key, required this.news});
  final News news;
  @override
  State<NewsItem> createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  User userCurrent = User("","","","","",false);
  int countComment = 12000;
  int countLike = 0;
  bool isFavorite=false;
  Future<void> _loadUserDataFromFirestore() async {
  final userController = ControllerUserLogin();
  final user = await userController.getUserInfo();
  if (user != null) {
    final userData = await userController.getUserInfoFromFirestore(user.uid);
    if (userData != null) {
      setState(() {
         userCurrent.uid = user.uid;
         userCurrent.displayName = userData['displayName']??"Username";
         userCurrent.email = userData['email'].toString();
         userCurrent.password = userData['password'].toString();
         userCurrent.birthday = userData['birthday']??"1/1/2000";
         userCurrent.gender = userData['gender'].toString()==true?true:false;
      });
    } else {
      // Handle case where user data is not available
      print('Không thể lấy thông tin người dùng từ Firestore');
    }
  } else {
    // Handle case where user is not authenticated
    print('Người dùng chưa đăng nhập');
    // You might want to redirect to the login screen
  }
}

  String formatCount(int number){
    if(number<10000)
    {
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
    }

   favorite() {
    if(ControllerNews.checkUserLiked(userCurrent.uid,widget.news)==true){
      return IconButton(
              onPressed: (){
                    setState(() {                     
                      ControllerNews.removeNewsFavorite(userCurrent.displayName, widget.news);
                      countLike--;
                      
                    });
                      
              },
              icon: FaIcon(FontAwesomeIcons.solidHeart,color: Colors.red[500],size: 16,) 
        );
    }
    else{
    return IconButton(
      onPressed: (){
          if(ControllerUserLogin.isLogin){
            setState(() {   
              ControllerNews.saveNewsFavorite(userCurrent.uid,widget.news);
              countLike++;
            });
            
          }
          else{
            showDialogLogin(context);
          }
      },
      icon: const FaIcon(FontAwesomeIcons.heart,size: 16,) 
      );}
  }

  @override
  void initState() {
    _loadUserDataFromFirestore();
    super.initState();
    getCountLike();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
    onTap: () {
        ControllerNews.saveNewsRead(userCurrent.uid,widget.news);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetailScreen(news: widget.news),
          ),
        );
        
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
                  onTap: (){
                    var official;
                    setState(() {
                      official = ControllerOfficial.getOfficialByName(widget.news.author);
                    });
                    if(official!=null){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>OfficialScreen(official: official)));
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
                  onTap: (){
                    var official;
                    setState(() {
                      official = ControllerOfficial.getOfficialByName(widget.news.author);
                    });
                    if(official!=null){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>OfficialScreen(official: official)));
                    }
                  },
                  child: Text(widget.news.author,style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600
                  ),
                                ),
                ),
              Expanded(
                child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  favorite(),
                  Text(formatCount(countLike),style:const TextStyle(fontSize: 16),),
                  Row(
                    children: [
                      IconButton(
                        onPressed:()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>NewsDetailScreen(news: widget.news))) ,
                        icon: const FaIcon(FontAwesomeIcons.comment,size: 16),
                      ),
                    ],
                  ),
                  Text(formatCount(countComment),style:const TextStyle(fontSize: 16)),
                  IconButton(
                    onPressed: () async{
                      await Share.share("${widget.news.title}\n\n${widget.news.link}");
                    },
                    icon: const FaIcon(FontAwesomeIcons.share,color: Colors.black38,size: 16,),
                  )
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