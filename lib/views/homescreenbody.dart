import 'package:flutter/material.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
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
      body: Container(
        child: Text('home Screen '),
      ),
    );
  }
}