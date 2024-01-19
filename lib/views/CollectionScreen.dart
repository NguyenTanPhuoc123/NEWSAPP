import 'package:doandidong/control/ControllerNews.dart';
import 'package:doandidong/model/News.dart';
import 'package:doandidong/views/FavoriteNewsItem.dart';
import 'package:flutter/material.dart';

class CollectionScreen extends StatefulWidget {
  const CollectionScreen({super.key});

  @override
  State<CollectionScreen> createState() => _CollectionScreenState();
}

class _CollectionScreenState extends State<CollectionScreen> {
  List<News> newsCollection = List.filled(0,News("","",List.filled(0,"",growable: true),"","","","",""),growable: true);
  @override
  void initState() {
    super.initState();
    _initiallizePrefs();
  }
  _initiallizePrefs() async{
    await ControllerNews.init();
    setState(() {
    ControllerNews.loadListNewsFromJson('listNews');
    newsCollection = ControllerNews.listNewsCollection;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Bộ sưu tập(${newsCollection.length})',style:const TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
        centerTitle: true,
        leading: IconButton(
          onPressed: ()=>Navigator.pop(context),
          icon: const Icon(Icons.arrow_back,color: Colors.black38,)
        ),
        actions: [
          IconButton(onPressed: (){},icon:const Icon(Icons.delete,color: Colors.black38,))
        ],
      ),
      body: newsCollection.isEmpty ? const Center(child: Text("Chưa có tin nào được lưu",style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w300
      ),)):
      ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: newsCollection.length,
        itemBuilder: (context,index){
          return FavoriteNewsItem(news: newsCollection[index]);
        }
      )
    );
  }
}

