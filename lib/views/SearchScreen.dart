import 'package:doandidong/control/ControllerNews.dart';
import 'package:doandidong/model/news.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var history = [
    "Lịch nghỉ tết 2024",
    "MU vật vã đi tim quá khứ ",
    "Onana cầu thủ mang danh hiệu thủ thành chơi chân hay nhất "
  ];
  List<News> listNews = List.filled(0,News("","","","","","",),growable: true);
  @override
  void initState() {
    super.initState();
    setState(() {
      listNews = ControllerNews.listNews;
    });
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
          decoration: InputDecoration(
            hintText: "Nhập nội dung tìm kiếm"
          )
        ),
        centerTitle: true,
        actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.search,color: Colors.black38,))],
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
                    itemCount: history.length,
                    itemBuilder: (context,index){
                      return InkWell(
                        onTap: (){},
                        child: Container(
                          margin: const EdgeInsets.all(3),
                          child: Text(history[index],style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400
                          ),),
                        ),
                      );
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
              itemCount: listNews.length,
              itemBuilder: (context,index){
                return Container(
                  margin: const EdgeInsets.all(5),
                  child: InkWell(
                    onTap: (){},
                    child:Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: NetworkImage(listNews[index].urlImage),
                            fit: BoxFit.fill
                          ),
                        )
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(listNews[index].title,style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500
                          ),),
                        )
                      ],
                    )
                  ),
                );
              }
            )
          ]
        ),
      ),
    );
  }
}