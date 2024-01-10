import 'package:doandidong/control/ControllerNews.dart';
import 'package:doandidong/model/news.dart';
import 'package:flutter/material.dart';

class NewsDetailScreen extends StatefulWidget {
  const NewsDetailScreen({super.key, required this.news});
  final News news;
  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  List<String> contents = List.filled(0,"",growable: true);

  @override
  void initState() {
    super.initState();
    ControllerNews.contents.clear();
    ControllerNews.getContent(widget.news.content).then((_){
      setState(() {
        contents = ControllerNews.contents;
      });
      
    });
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
                fontSize: 16,
                fontWeight: FontWeight.w400
              ),),
              
            ],
          ),
          const SizedBox(height: 5),
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
            itemCount: contents.length,
            itemBuilder: (context,index){
              return Container(
                margin: const EdgeInsets.all(5),
                child: Text(contents[index],style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500
                ),),
              );
            }
          ),
          const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 5),
                     Text("Bình Luận",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600))
                  ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: (){},
                icon: Icon(Icons.bookmark)
              ),

            ],
          ),
          Container(
            color: Colors.grey[100],
            child: Column(
              children: [
                Row(
                  children: [
                    const SizedBox(width: 5,),
                    Expanded(
                      child: TextField(
                        controller: TextEditingController(),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder()
                          ),                   
                      ),
                    ),
                    const SizedBox(width: 10,),
                    IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.send,color: Colors.grey),
                    )
                  ],
                ),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Huy Sơn",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500)),
                      Text("8 giờ trước",style:TextStyle(fontSize: 12,fontWeight: FontWeight.w300))
                    ],
                  ),
                  subtitle: Text("Ngoan cố lắm",style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                  leading: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(widget.news.urlImage),fit: BoxFit.fill),
                      shape: BoxShape.circle
                    ),
                      
                  ),
                ),
                
              ],
            ),
          )
        ]
        )
      ),  
    );
  }
}