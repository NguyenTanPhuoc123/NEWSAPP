import 'package:doandidong/views/FavoriteScreen.dart';
import 'package:doandidong/views/HistoryScreen.dart';
import 'package:doandidong/views/PersonalScreen.dart';
import 'package:doandidong/views/HomeScreen.dart';
import 'package:doandidong/views/MainScreen.dart';
import 'package:doandidong/views/NewsDetailScreen.dart';
import 'package:doandidong/views/VideoScreen.dart';
import 'package:doandidong/views/loginscreen.dart';
import 'package:doandidong/views/PersonalInformationScreen.dart';
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
      home: const MainScreen(),
    );
  }
}
