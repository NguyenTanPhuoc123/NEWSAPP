import 'package:doandidong/control/api_service.dart';
import 'package:doandidong/model/article_model.dart';
import 'package:doandidong/views/NewsItem.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiService client = ApiService();

  var categorys = [
    "Đọc nhiều",
    "Cho bạn",
    "Mới nhất",
    "Thể thao",
  ];
  int currentPage = 0;

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
            FutureBuilder(
              future: client.getArticles(),
              builder: (context,AsyncSnapshot<List<Article>> snashots){
                if(snashots.hasData){
                  List<Article> articles = snashots.requireData;
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    primary: false,
                    shrinkWrap: true,
                    physics:AlwaysScrollableScrollPhysics(),
                    itemCount: articles.length,
                    itemBuilder: (context,index){
                    return NewsItem(article: articles[index]);
                    }
                  );
                }
                return Center(
                  child: CircularProgressIndicator(color: Colors.green[400],),
                );
              }
            ),
          ],
        ),
      )
    );
  }
}