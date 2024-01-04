import 'package:doandidong/views/homescreenbody.dart';
import 'package:doandidong/views/notificationscreen.dart';
import 'package:doandidong/views/personScreen.dart';
import 'package:doandidong/views/videoScreen.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex=0;
  late List<Widget> _widgetOptions;
  @override 
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
     HomeScreenBody(),
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
    appBar: AppBar(
      title: Text('VNEWS', style: TextStyle(
        fontSize: 30,
        color: Colors.green
      ),
      ),
      actions: [
        IconButton(onPressed: (){},
         icon: Icon(Icons.search)
         )
      ],
      
    ),
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
            label: 'Danh mục',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Thông báo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Người dùng',
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