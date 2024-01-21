import 'package:doandidong/control/ControllerNews.dart';
import 'package:doandidong/model/News.dart';
import 'package:doandidong/model/User.dart';
import 'package:doandidong/views/FavoriteNewsItem.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  User user = User("","","abc","",true);
  List<News> newsFavorites = List.filled(0,News("","",List.filled(0,"",growable: true),"","","","",""));
  @override
  void initState() {
    super.initState();
      ControllerNews.getListNewsFavorite(user.displayName).then((value){
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
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.sort_rounded,
                  color: Colors.black38,
                ))
          ],
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
