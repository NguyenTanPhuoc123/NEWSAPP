import 'package:flutter/material.dart';
import 'package:doandidong/control/ControllerNews.dart';
import 'package:doandidong/model/news.dart';
import 'package:doandidong/views/NewsItem.dart';
import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart' as http;

class TongHop extends StatefulWidget {
  const TongHop({super.key});

  @override
  State<TongHop> createState() => _TongHopState();
}

class _TongHopState extends State<TongHop> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(246, 238, 238, 1),
                  borderRadius: BorderRadius.circular(18)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 130,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(newList[index].urlImage),
                              fit: BoxFit.fill),
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(18))),
                    ),
                    Container(
                      margin: const EdgeInsets.all(3),
                      child: Text(
                        newList[index].title,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const SizedBox(width: 3),
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(newList[index].urlLogo),
                                  fit: BoxFit.fill)),
                        ),
                        const SizedBox(width: 3),
                        Text(
                          newList[index].author,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(180, 10, 0, 10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.favorite,
                                ),
                                SizedBox(width: 3),
                                Text(
                                  '12',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                                SizedBox(width: 15),
                                Icon(
                                  Icons.chat,
                                ),
                                SizedBox(width: 3),
                                Text(
                                  '10',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                                SizedBox(width: 15),
                                Icon(
                                  Icons.reply,
                                ),
                                SizedBox(width: 3),
                                Text(
                                  '',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ]),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          newList[index].pushDate,
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w300),
                        ),
                        const SizedBox(
                          width: 5,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 3,
                    )
                  ]));
        });
  }
}

class News {
  String title;
  String urlLogo;
  String urlImage;
  String content;
  String author;
  String pushDate;

  News(this.title, this.urlLogo, this.content, this.pushDate, this.author,
      this.urlImage);
}

List newList = [
  News(
      'Tết nguyên đán 2024 sinh viên được nghỉ 1 tháng',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2xYeT4Lm13GB7ArU7LMxsB2FpySrQjlpohh9jcOVv-A&s',
      '',
      '8h trước',
      'Báo',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2xYeT4Lm13GB7ArU7LMxsB2FpySrQjlpohh9jcOVv-A&s'),
  News(
      'Tết nguyên đán 2024 sinh viên được nghỉ 1 tháng',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2xYeT4Lm13GB7ArU7LMxsB2FpySrQjlpohh9jcOVv-A&s',
      '',
      '8h trước',
      'Báo',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2xYeT4Lm13GB7ArU7LMxsB2FpySrQjlpohh9jcOVv-A&s'),
  News(
      'Tết nguyên đán 2024 sinh viên được nghỉ 1 tháng',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2xYeT4Lm13GB7ArU7LMxsB2FpySrQjlpohh9jcOVv-A&s',
      '',
      '8h trước',
      'Báo',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2xYeT4Lm13GB7ArU7LMxsB2FpySrQjlpohh9jcOVv-A&s'),
  News(
      'Tết nguyên đán 2024 sinh viên được nghỉ 1 tháng',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2xYeT4Lm13GB7ArU7LMxsB2FpySrQjlpohh9jcOVv-A&s',
      '',
      '8h trước',
      'Báo',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2xYeT4Lm13GB7ArU7LMxsB2FpySrQjlpohh9jcOVv-A&s'),
  News(
      'Tết nguyên đán 2024 sinh viên được nghỉ 1 tháng',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2xYeT4Lm13GB7ArU7LMxsB2FpySrQjlpohh9jcOVv-A&s',
      '',
      '8h trước',
      'Báo',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2xYeT4Lm13GB7ArU7LMxsB2FpySrQjlpohh9jcOVv-A&s'),
];
