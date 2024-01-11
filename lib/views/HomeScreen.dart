import 'package:doandidong/control/ControllerNews.dart';
import 'package:doandidong/model/news.dart';
import 'package:doandidong/views/NewsItem.dart';
import 'package:flutter/material.dart';
import 'package:webfeed/webfeed.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<News> listNews = List.filled(0,News("","","","","",""),growable: true);
  RssFeed feed = RssFeed();
  var categorys = [
    "Đọc nhiều",
    "Cho bạn",
    "Mới nhất",
    "Thể thao",
  ];
  int currentPage = 0;
  load() async{
     ControllerNews.loadFeed().then((result){
      if(null == result || result.toString().isEmpty){
        return;
      }
      setState(() {
        feed = result;
      });
    });
    
  }

  @override
  void initState() {
    super.initState();
    load();
    ControllerNews.getListNews().then((value){
      listNews = ControllerNews.listNews;
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
        actions: [
          IconButton(onPressed: (){},
          icon: const Icon(Icons.search,color: Color.fromRGBO(85, 80, 80, 1),))
        ],
      ),  
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(5),
              height: 50,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categorys.length,
                itemBuilder: (context,index){
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            currentPage = index;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                            color: index == currentPage ? const Color.fromRGBO(52, 221, 99, 0.4): Colors.grey[100],
                            borderRadius: BorderRadius.circular(20),
                            border:Border.all(color: Colors.black26,width: 2)
                          ),
                          child:Center(
                            child: Text(categorys[index],style: TextStyle(
                              color: index == currentPage ? const Color.fromRGBO(77, 180, 60, 1): Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600
                            ),),
                          )
                        ),
                      ),
                      
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
              listNews.isEmpty? const Column(children:[ SizedBox(height: 180) ,CircularProgressIndicator(),]):
              ListView.builder(
                scrollDirection: Axis.vertical,
                primary: false,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: listNews.length,
                itemBuilder: (context,index){
                  return NewsItem(news: listNews[index]);
                  }
                )
          ],
        ),
      )
    );
  }
}
    