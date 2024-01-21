import 'package:flutter/material.dart';

class historyName extends StatelessWidget {
  final String path;
  final String title;
  const historyName({super.key, required this.path, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: InkWell(
          onTap: () {},
          child: Row(
            children: [
              Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(path), fit: BoxFit.fill),
                  )),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w500),
                ),
              )
            ],
          )),
    );
  }
}
