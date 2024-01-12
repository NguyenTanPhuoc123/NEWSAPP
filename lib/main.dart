import 'package:doandidong/views/history.dart';
import 'package:doandidong/views/personal.dart';
import 'package:doandidong/views/HomeScreen.dart';
import 'package:doandidong/views/MainScreen.dart';
import 'package:doandidong/views/NewsDetailScreen.dart';
import 'package:doandidong/views/VideoScreen.dart';
import 'package:doandidong/views/loginscreen.dart';
import 'package:doandidong/views/personal_information.dart';
import 'package:flutter/material.dart';
import 'views/notificationscreen.dart';
import 'views/followScreen.dart';
import 'views/officialScreen.dart';
import 'views/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/noti',
      routes: {
        '/noti': (context) => Noti(),
        '/follow': (context) => Follow(),
        '/official': (context) => Official(),
        '/home': (context) => HomeScreen(),
      },
      title: 'VNEWS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const screen_history(),
    );
  }
}
