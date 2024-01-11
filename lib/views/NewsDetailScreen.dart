import 'package:flutter/material.dart';

class NewsDetailScreen extends StatefulWidget {
  const NewsDetailScreen({super.key});

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("VNEWS",style: TextStyle(
          color: Color.fromRGBO(75, 177, 73, 1),
          fontSize: 24,
          fontWeight: FontWeight.w600
        ),),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.arrow_back,color: Colors.black54,)
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          
        ]
        )
      ),  
    );
  }
}