import 'package:doandidong/control/ControllerOfficial.dart';
import 'package:doandidong/model/news.dart';
import 'package:doandidong/control/ControllerUserLogin.dart';
import 'package:doandidong/views/AlertDialog.dart';
import 'package:doandidong/views/NewsDetailScreen.dart';
import 'package:doandidong/views/officialScreen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:doandidong/views/HistoryScreen.dart';
import 'package:doandidong/control/ControllerNews.dart';

class NewsItem extends StatefulWidget {
  const NewsItem({Key? key, required this.news, this.onAddedToHistory})
      : super(key: key);
  final News news;
  final Function(News news)? onAddedToHistory;

  @override
  State<NewsItem> createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  final DatabaseReference _databaseReference = FirebaseDatabase(
    databaseURL: 'https://newsapp-a46a0-default-rtdb.firebaseio.com/',
  ).reference();

  List<dynamic> lst_history = [];
  List<Map<dynamic, dynamic>> users = [];

  Future<void> _fetchData() async {
    try {
      DatabaseEvent event = await _databaseReference.once();
      DataSnapshot? dataSnapshot = event.snapshot;

      if (dataSnapshot != null && dataSnapshot.value != null) {
        List<dynamic> data = (dataSnapshot.value as Map)['user'];
        data.forEach((value) {
          users.add(value);
        });
        for (var value in users[0]['']) {
          lst_history.add(value);
          print(lst_history);
        }
        setState(() {});
      }
    } catch (error) {
      print("Error fetching data: $error");
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
    _loadOrderCount();
  }

  final int countLike = 0;
  int countComment = 12000;
  bool isFavorite = false;

  String formatCount(int number) {
    if (number < 10000) {
      return "$number";
    } else if (number >= 10000 && number < 1000000) {
      return "${number ~/ 1000}K+";
    } else if (number < 1000000000) {
      return "${number ~/ 1000000}M+";
    } else {
      return "1T+";
    }
  }

  int historyNumber = 0;
  Future<void> _loadOrderCount() async {
    try {
      DatabaseEvent event = await _databaseReference.child('users/${0}').once();
      DataSnapshot? dataSnapshot = event.snapshot;

      if (dataSnapshot != null && dataSnapshot.value != null) {
        Map fetchedUserNumber = dataSnapshot.value as Map;
        setState(() {
          //orderNumber = fetchedUserNumber['orderCount'];
          historyNumber = fetchedUserNumber['historyCount'];
        });
      }
    } catch (error) {
      print("Error fetching data: $error");
    }
  }

  Future<void> addNotication() async {
    try {
      await _databaseReference
          .child('users/${0}')
          .child('history')
          .child('${historyNumber}')
          .set({
        'avataUrl': '${widget.news.urlImage}',
        'title': '${widget.news.title}'
      });
      historyNumber++;
      await _databaseReference.child('users/${0}').update({
        'historyCount': historyNumber,
      });
    } catch (e) {
      print(e.toString());
    }
  }

  favorite() {
    if (isFavorite) {
      return IconButton(
          onPressed: () {
            setState(() {
              if (ControllerUserLogin.isLogin) {
                //        countLike--;
                isFavorite = !isFavorite;
              } else {
                showDialogLogin(context);
              }
            });
          },
          icon: FaIcon(
            FontAwesomeIcons.solidHeart,
            color: Colors.red[500],
            size: 16,
          ));
    }
    return IconButton(
        onPressed: () {
          setState(() {
            if (ControllerUserLogin.isLogin) {
              //      countLike++;
              isFavorite = !isFavorite;
            } else {
              showDialogLogin(context);
            }
          });
        },
        icon: const FaIcon(
          FontAwesomeIcons.heart,
          size: 16,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Khi người dùng nhấp vào, gọi hàm callback để thông báo

        // Điều hướng đến trang NewsDetailScreen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetailScreen(news: widget.news),
          ),
        );
        addNotication();
        _loadOrderCount();
        // addNewsToHistory(widget.news);
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
                  onTap: () {
                    var official;
                    setState(() {
                      official = ControllerOfficial.getOfficialByName(
                          widget.news.author);
                    });
                    if (official != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  OfficialScreen(official: official)));
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
                  onTap: () {
                    var official;
                    setState(() {
                      official = ControllerOfficial.getOfficialByName(
                          widget.news.author);
                    });
                    if (official != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  OfficialScreen(official: official)));
                    }
                  },
                  child: Text(
                    widget.news.author,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    favorite(),
                    Text(
                      formatCount(countLike),
                      style: const TextStyle(fontSize: 16),
                    ),
                    Row(children: [
                      IconButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    NewsDetailScreen(news: widget.news))),
                        icon: const FaIcon(FontAwesomeIcons.comment, size: 16),
                      ),
                    ])
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

  void addNewsToHistory(News news) {
    // Kiểm tra xem tin tức đã có trong lịch sử chưa
    bool isNewsInHistory =
        widget.onAddedToHistory != null && widget.onAddedToHistory!(news);

    // Nếu tin tức đã có trong lịch sử, hãy đưa nó lên đầu danh sách
    if (isNewsInHistory) {
      // Tin tức đã có trong lịch sử, không cần thực hiện thêm nữa
      return;
    }

    // Tin tức chưa có trong lịch sử, thêm bình thường
    // Bạn có thể cần gọi hàm thích hợp để thêm tin tức vào lịch sử.
    // Ví dụ: ControllerNews.addNewsToHistory(news);

    // Nếu bạn cần thực hiện thêm tin tức vào danh sách lịch sử, hãy gọi hàm này
    if (widget.onAddedToHistory != null) {
      widget.onAddedToHistory!(news);
    }
  }

  // void addNewsToHistory(News news) {
  //   setState(() {
  //     // Kiểm tra xem tin tức đã có trong lịch sử chưa
  //     bool isNewsInHistory = newsHistorys.any((element) =>
  //             element.title == news.title && element.author == news.author
  //         // Các điều kiện kiểm tra khác nếu cần
  //         // element.someOtherProperty == news.someOtherProperty
  //         );

  //     // Nếu tin tức đã có trong lịch sử, hãy đưa nó lên đầu danh sách
  //     if (isNewsInHistory) {
  //       newsHistorys.removeWhere((element) =>
  //               element.title == news.title && element.author == news.author
  //           // Các điều kiện kiểm tra khác nếu cần
  //           // element.someOtherProperty == news.someOtherProperty
  //           );
  //       newsHistorys.insert(0, news);
  //     } else {
  //       // Tin tức chưa có trong lịch sử, thêm bình thường
  //       newsHistorys.insert(0, news);
  //     }
  //   });
  // }
}
