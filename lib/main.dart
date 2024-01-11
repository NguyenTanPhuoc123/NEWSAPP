
import 'package:doandidong/views/history.dart';
import 'package:doandidong/views/personal.dart';
import 'package:doandidong/views/HomeScreen.dart';
import 'package:doandidong/views/MainScreen.dart';
import 'package:doandidong/views/NewsDetailScreen.dart';
import 'package:doandidong/views/VideoScreen.dart';
import 'package:doandidong/views/loginscreen.dart';
import 'package:doandidong/views/personal_information.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VNEWS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const screen_history (),
    );
  }
}
