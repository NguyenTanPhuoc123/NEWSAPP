// ignore: file_names
import 'package:doandidong/control/ControllerNews.dart';
import 'package:doandidong/model/news.dart';
import 'package:doandidong/views/FavoriteNewsItem.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'NewsDetailScreen.dart';
import 'package:doandidong/views/HistoryName.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final DatabaseReference _databaseReference = FirebaseDatabase(
    databaseURL: 'https://newsapp-a46a0-default-rtdb.firebaseio.com/',
  ).reference();

  List<dynamic> lst_history = [];
  Map<dynamic, dynamic> users = {};

  Future<void> _fetchData() async {
    try {
      DatabaseEvent event = await _databaseReference.once();
      DataSnapshot? dataSnapshot = event.snapshot;

      if (dataSnapshot != null && dataSnapshot.value != null) {
        List<dynamic> data = (dataSnapshot.value as Map)['users'];
        data.forEach((value) {
          users.addAll(value);
        });
        for (var value in users[0]['history']) {
          lst_history.add(value);
          print(lst_history);
        }
        setState(() {
          print(lst_history);
        });
      }
    } catch (error) {
      print("Error fetching data: $error");
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
    print(lst_history);
  }

//  List<News> newsHistorys = [];
  // @override
  // void initState() {
  //   super.initState();
  //   updateHistoryList();
  // }

  // void updateHistoryList() {
  //   setState(() {
  //     newsHistorys = ControllerNews.listNews;
  //     print(newsHistorys);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'LỊCH SỬ ĐỌC',
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
        body: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: lst_history.length,
            itemBuilder: (context, index) {
              return historyName(
                path: '${users[0]['history'][index]['avataUrl']}',
                title: '${users[0]['history'][index]['title']}',
              );
            }));
  }

//   void addNewsToHistory(News news) {
//     setState(() {
//       // Kiểm tra xem tin tức đã có trong lịch sử chưa
//       bool isNewsInHistory = newsHistorys.any((element) =>
//               element.title == news.title && element.author == news.author
//           // Các điều kiện kiểm tra khác nếu cần
//           // element.someOtherProperty == news.someOtherProperty
//           );

//       // Nếu tin tức đã có trong lịch sử, hãy đưa nó lên đầu danh sách
//       if (isNewsInHistory) {
//         newsHistorys.removeWhere((element) =>
//                 element.title == news.title && element.author == news.author
//             // Các điều kiện kiểm tra khác nếu cần
//             // element.someOtherProperty == news.someOtherProperty
//             );
//         newsHistorys.insert(0, news);
//       } else {
//         // Tin tức chưa có trong lịch sử, thêm bình thường
//         newsHistorys.insert(0, news);
//       }
//     });
//   }
}
