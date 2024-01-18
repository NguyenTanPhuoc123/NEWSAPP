import 'package:doandidong/control/ControlUser.dart';
import 'package:doandidong/control/ControllerUserLogin.dart';
import 'package:doandidong/model/news.dart';
import 'package:doandidong/model/comment.dart';
import 'package:doandidong/model/User.dart';
import 'package:doandidong/views/AlertDialog.dart';
import 'package:doandidong/views/CommentItem.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';

class NewsDetailScreen extends StatefulWidget {
  const NewsDetailScreen({super.key, required this.news});
  final News news;
  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  var content = TextEditingController();
  int countLike = 1234;
  bool isFavorite=false;
  List<Comment> comments = [
    Comment(User("","","Phước Nguyễn","",true),"1/1/2024","Hay lắm!!!"),
    Comment(User("","","Danh Hồ","",true),"1/1/2024","Hay lắm!!!"),
    Comment(User("","","Trường Phạm","",true),"1/1/2024","Hay lắm!!!"),
    Comment(User("","","Trân Nguyễn","",false),"1/1/2024","Hay lắm!!!"),
  ];
  
  addComment(Comment comment){
    comments.insert(0,comment);
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
  favorite(){
    if(isFavorite){
      return IconButton(
              onPressed: (){
                setState(() {
                  countLike--;
                  isFavorite = !isFavorite;
                  
                }); 
              },
              icon: FaIcon(FontAwesomeIcons.solidHeart,color: Colors.red[500],size: 16,) 
        );
    }
    return IconButton(
      onPressed: (){
        setState(() {
          isFavorite = !isFavorite;
          countLike++;
        }); 
      },
      icon: const FaIcon(FontAwesomeIcons.heart,size: 16,) 
      );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("VNEWS",style: TextStyle(
          color: Color.fromRGBO(75, 177, 73, 1),
          fontSize: 24,
          fontWeight: FontWeight.w600
        ),),
        centerTitle: true,
        leading: IconButton(
          onPressed: ()=> Navigator.pop(context),
          icon: const Icon(Icons.arrow_back,color: Colors.black54,)
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Container(
            margin: const EdgeInsets.fromLTRB(5,5,5,5),
            child: Text(widget.news.title,style: const TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.w600
            ),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 5,),
              Text(widget.news.pushDate,style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400
              ),),
              
            ],
          ),
          const SizedBox(height: 5),
          Text(widget.news.description,style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500
                ),
          ),
          Container(
            width: 300,
            height: 300,
            margin: const EdgeInsets.fromLTRB(5,0,5,10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(widget.news.urlImage),fit: BoxFit.cover)
            ),
          ),
          ListView.builder(
            primary: false,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: widget.news.contents.length,
            itemBuilder: (context,index){
              return Container(
                margin: const EdgeInsets.all(5),
                child: Text(widget.news.contents[index],style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500
                ),),
              );
            }
          ),
           Row(
            children: [
              IconButton(
                onPressed: (){
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Đã thêm vào bộ sưu tập"),
                        duration: Duration(seconds: 1),
                      )
                    );
                      
                },
                icon:  Icon(Icons.bookmark,color: Colors.grey[200])
              ),
              favorite(),
              Text(formatCount(countLike),style:const TextStyle(fontSize: 16),),
              const SizedBox(width: 10),
              IconButton(
                      onPressed: () async{
                        if(ControllerUserLogin.isLogin){
                      await Share.share("${widget.news.title}\n\n${widget.news.link}");
                        }else{
                          showDialogLogin(context);
                        }
                      },
                    icon: const FaIcon(FontAwesomeIcons.share,color: Colors.black38,size: 16,),
                  )
                    
            ],
          ),
           Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 5),
                     Text("Bình Luận(${comments.length})",style: const TextStyle(fontSize: 22,fontWeight: FontWeight.w600))
                  ],
          ),
          const SizedBox(height: 5),
          Container(
            color: Colors.grey[100],
            child: Column(
              children: [
                Row(
                  children: [
                    const SizedBox(width: 5,),
                    Expanded(
                      child: TextField(
                        controller: content,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder()
                          ),                   
                      ),
                    ),
                    const SizedBox(width: 10,),
                    IconButton(
                    onPressed: () {
                      setState(() {
                        addComment(
                          Comment(
                            User("","","Người mới","",true),
                            "1/1/2024",
                            content.text
                            )
                          );
                      });
                    },
                    icon: const Icon(Icons.send,color: Colors.grey),
                    )
                  ],
                ),
                ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: comments.length,
                  itemBuilder: (context,index){
                    return CommentItem(comment: comments[index]);
                  }
                )
                
              ],
            ),
          )
        ]
        )
      ),  
    );
  }
}