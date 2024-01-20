import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> paragraphContents = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    // Đường dẫn HTML trực tiếp từ internet
    final String url = 'https://vtc.vn/xe-16-cho-chay-ngun-ngut-giua-duong-o-tp-hcm-tai-xe-thoat-nan-ar848713.html';

    // Tải HTML từ URL
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // Phân tích HTML
      var document = parse(response.body);

      // Trích xuất nội dung từ tất cả các thẻ <p>
      var paragraphs = document.getElementsByClassName('edittor-content box-cont mt15 clearfix');
      
      setState(() {
        for (var element in paragraphs) {
          var a =  element.querySelectorAll('p');
          setState(() {
            paragraphContents = a.map((e) => e.text).toList();
          });
          
        }
      });
    } else {
      print('Failed to load HTML content');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Content from <p> Tags'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: paragraphContents.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(paragraphContents[index]),
            );
          },
        ),
      ),
    );
  }
}
