// import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:doandidong/model/notification.dart';
// import 'package:firebase_core/firebase_core.dart';

// class FirebaseService {
//   static void setupNotificationsListener() {
//     DatabaseReference reference =
//         FirebaseDatabase.instance.ref().child('notifications');
//     reference.onChildAdded.listen((event) {
//       // Xử lý thông báo mới ở đây
//       print('New notification: ${event.snapshot.value}');
//     });
//   }

//   static Future<List<NotificationItem>> getNotifications() async {
//     DatabaseReference reference =
//         FirebaseDatabase.instance.ref().child('notifications');
//     DatabaseEvent event = await reference.once();

//     List<NotificationItem> notifications = [];
//     Map<dynamic, dynamic> data = event.snapshot.value;

//     if (data != null) {
//       data.forEach((key, value) {
//         NotificationItem notification = NotificationItem(
//           avatarUrl: value['avatarUrl'],
//           username: value['username'],
//           description: value['description'],
//           timestamp: value['timestamp'],
//         );
//         notifications.add(notification);
//       });
//     }

//     return notifications;
//   }
// }

// class NotificationScreen extends StatefulWidget {
//   @override
//   _NotificationScreenState createState() => _NotificationScreenState();
// }

// class _NotificationScreenState extends State<NotificationScreen> {
//   @override
//   void initState() {
//     super.initState();
//     FirebaseService.setupNotificationsListener();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text(
//             'THÔNG BÁO',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
//           ),
//           centerTitle: true,
//         ),
//         body: FutureBuilder(
//             future: FirebaseService.getNotifications(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return CircularProgressIndicator();
//               } else if (snapshot.hasError) {
//                 return Text('Error: ${snapshot.error}');
//               } else {
//                 List<NotificationItem> notifications = snapshot.data;
//                 return ListView.builder(
//                   scrollDirection: Axis.vertical,
//                   itemCount: notifications.length,
//                   itemBuilder: (context, index) {
//                     return Card(
//                         child: Row(
//                       children: [
//                         Column(
//                           children: [
//                             Container(
//                                 margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
//                                 child: CircleAvatar(
//                                   backgroundImage: NetworkImage(
//                                       notifications[index].avatarUrl),
//                                 ))
//                           ],
//                         ),
//                         Column(
//                           children: [
//                             Row(
//                               children: [
//                                 Text(
//                                   notifications[index].username,
//                                   textAlign: TextAlign.start,
//                                   style: const TextStyle(
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                                 Text(notifications[index].description),
//                               ],
//                             ),
//                             Container(
//                               margin: const EdgeInsets.only(left: 200),
//                               child: Text(
//                                   '${notifications[index].timestamp} trước',
//                                   textAlign: TextAlign.end,
//                                   style: const TextStyle(color: Colors.grey)),
//                             )
//                           ],
//                         ),
//                       ],
//                     ));
//                   },
//                 );
//               }
//             }));
//   }
// }

// // class Notification {
// //   String name;
// //   String description;
// //   String imgUrl;
// //   String time;

// //   Notification(this.name, this.description, this.time, this.imgUrl);
// // }

// // List notiList = [
// //   Notification('Báo đời ', 'đã đăng một bài báo mới', '1 giờ trước', ''),
// //   Notification('Báo đời ', 'đã đăng một bài báo mới', '1 giờ trước', ''),
// //   Notification('Báo đời ', 'đã đăng một bài báo mới', '1 giờ trước', ''),
// //   Notification('Báo đời ', 'đã đăng một bài báo mới', '1 giờ trước', ''),
// //   Notification('Báo đời ', 'đã đăng một bài báo mới', '1 giờ trước', ''),
// // ];
