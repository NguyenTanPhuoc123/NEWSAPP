import 'package:flutter/material.dart';
class IconTitleWidget extends StatelessWidget {
  const IconTitleWidget({super.key});
  @override
  Widget build(BuildContext context) {
    imageCache.clear();
    final String imgUrl =
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFTYXM1dAQXVwOZjqfiTSreh0Tp7Neo4wEGg&usqp=CAU';
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(imgUrl), fit: BoxFit.fill)),
        ),
        Text(
          'VTC',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Icon(
          Icons.check_circle_outline_sharp,
          color: Colors.green,
        ),
      ],
    );
  }
}