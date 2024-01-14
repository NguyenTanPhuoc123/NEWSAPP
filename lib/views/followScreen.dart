import 'package:flutter/material.dart';

class FollowScreen extends StatefulWidget {
  const FollowScreen({super.key});

  @override
  State<FollowScreen> createState() => _FollowScreenState();
}

class _FollowScreenState extends State<FollowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đang theo dõi',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
        centerTitle: true,
        leading: IconButton(
          onPressed: ()=>Navigator.pop(context),
          icon: const Icon(Icons.arrow_back,color: Colors.black38,)
        ),
        
      ),
      body: SingleChildScrollView(
        child: Column(
                children: [
        Expanded(
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                    child: Row(children: [
                  Column(children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(followList[index].imgUrl),
                              fit: BoxFit.fill)),
                    )
                  ]),
                  const SizedBox(width: 5),
                  Text(
                    followList[index].name,
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                      child: Container(
                    child: IconButton(
                        icon: Icon(Icons.done_all), onPressed: () {}),
                  ))
                ]));
              }),
        )
                ],
              ),
      ),
    );
  }
}

class Following {
  String name;
  String imgUrl;

  Following(this.name, this.imgUrl);
}

List followList = [
  Following('ethelmarquise',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZnQiD69bG6hrFl6x5vv6wiT3n5Tp_QOaPpfLFJoYgIw&s'),
  Following('TheMetaBarbie',
      'https://gocnhinso.com/wp-content/uploads/2022/12/meme-meo-hai-6.jpeg'),
  Following('pthchuc208779',
      'https://i.pinimg.com/736x/56/98/ac/5698ac3f37f7e5c727436d2335fa9df5.jpg'),
  Following('vutuyetquan88',
      'https://inkythuatso.com/uploads/thumbnails/800/2022/05/d1e79464f826d4d4be4e051973b85fda-12-14-57-01.jpg'),
  Following('L_univers2904',
      'https://afamilycdn.com/150157425591193600/2020/5/25/90090530211769606724281311815109567084919n-1590403790698636845403.jpg'),
];
