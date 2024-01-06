import 'package:doandidong/views/HomeScreen.dart';
import 'package:doandidong/views/PersonalScreen.dart';
import 'package:doandidong/views/notificationscreen.dart';
import 'package:doandidong/views/videoScreen.dart';
import 'package:flutter/material.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex=0;
  late List<Widget> _widgetOptions;
  @override 
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
     HomeScreen(),
     VideoScreen(),
     NotificationScreen(),
     PersonScreen()
    ];
  }
    void _onitemtap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: _widgetOptions.elementAt(_selectedIndex),
    bottomNavigationBar: 
      BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library_outlined),
            label: 'Video',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Thông báo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Cá nhân',
          )
        ],
        unselectedItemColor: Colors.black.withOpacity(0.6),
        selectedItemColor: Colors.green,
        backgroundColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onitemtap,
    )
    );
  }
}