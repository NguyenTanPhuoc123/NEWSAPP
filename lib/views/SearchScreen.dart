import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doandidong/control/ControllerNews.dart';
import 'package:doandidong/model/news.dart';
import 'package:doandidong/views/NewsDetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key });
   

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> listhistory = [];
  late TextEditingController searchController = TextEditingController(); 
  // khoi tao listNews 
  List<News> listNews = List.filled(0,News("","",List.filled(0,"",growable: true),"","","","",""),growable: true);
  // khoi tao danh sach search 
  List <News> listsearch= [];
  @override
  void initState() {
    super.initState();
    setState(() {
      listNews = ControllerNews.listNews;
      listsearch = listNews;
      loadSearchHistory();
    });
  }
  // ham tim kiem bai viet theo ten 
  void SearchTitle(String query) {
    setState(() {
      listsearch = listNews
          .where((news) =>
              news.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }
  // ham load cac tu khoa da search
   Future<void> loadSearchHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      listhistory = prefs.getStringList('historySearch') ?? [];
    });
  }
  // ham luu tu khoa tim kiem 
  Future<void> saveSearchHistory () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('historySearch', listhistory);
  } 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: ()=> Navigator.pop(context),
          icon: const Icon(Icons.arrow_back,color: Colors.black38,)
        ),
        title: TextField(
          controller: searchController,
          onChanged: (value){

          },
          decoration: InputDecoration(
            hintText: "Nhập nội dung tìm kiếm"
          )
        ),
        centerTitle: true,
        actions: [IconButton(
          onPressed: (){
            SearchTitle(searchController.text);
            if(!listhistory.contains(searchController.text)){
              listhistory.add(searchController.text);
              saveSearchHistory();
            }
            
          }, 
        icon: const Icon(Icons.search,color: Colors.black38,))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white24,
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Lịch sử tìm kiếm",style: TextStyle(
                        fontSize: 12,fontWeight: FontWeight.w300
                      ),)
                    ],
                  ),
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    primary: false,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context,index){
                    if(index<listhistory.length){
                        return InkWell(
                        onTap: (
                          
                        ){},
                        child: Container(
                          margin: const EdgeInsets.all(3),
                          child: Text(listhistory[index],style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400
                          ),),
                        ),
                      );
                    }
                    }
                  ),
                  
                ],
              ),
            ),
            const SizedBox(height: 40),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Đề xuất",style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold
                ),)
              ],
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              primary: false,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: listsearch.length,
              itemBuilder: (context,index){
                if(index<listsearch.length&& listsearch.length>0){
                  return Container(
                  margin: const EdgeInsets.all(5),
                  child: InkWell(
                    onTap: (){
                    },
                    child:Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: NetworkImage(listsearch[index].urlImage),
                            fit: BoxFit.fill
                          ),
                        )
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(listsearch[index].title,style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500
                          ),),
                        )
                      ],
                    )
                  ),
                );
                }
              }
            )

          ]
        ),
      ),
    );
  }
}