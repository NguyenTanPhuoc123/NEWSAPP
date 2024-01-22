import 'package:doandidong/control/ControllerNews.dart';
import 'package:doandidong/model/News.dart';
import 'package:doandidong/model/user.dart';
import 'package:doandidong/views/FavoriteNewsItem.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key,required this.user});
  final User user;
  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<News> newsFavorites = List.filled(0,News("","",List.filled(0,"",growable: true),"","","","",""));
  @override
  void initState() {
    super.initState();
      ControllerNews.getListNewsFavorite(widget.user.uid).then((value){
        setState(() {
          newsFavorites= value;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Danh sách đã thích(${newsFavorites.length})',
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black38,
              )),
        ),
        body: newsFavorites.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: newsFavorites.length,
                itemBuilder: (context, index) {
                  return FavoriteNewsItem(news: newsFavorites[index]);
                }));
  }
}
