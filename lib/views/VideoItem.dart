import 'package:doandidong/model/video.dart';
import 'package:doandidong/views/officialScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoItem extends StatefulWidget {
  const VideoItem({super.key,required this.video});
  final Video video;
  @override
  State<VideoItem> createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  late YoutubePlayerController youtubePlayerController;
  @override
  void initState() {
    super.initState();
    youtubePlayerController = YoutubePlayerController(initialVideoId: widget.video.urlVideo,
    flags: const YoutubePlayerFlags(autoPlay: true,mute: false,loop: true)
    );
  }

  

  @override
  Widget build(BuildContext context) {
    bool statusFollow = false;
    profile(){
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        InkWell(
          onTap: ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>OfficialScreen())),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: const DecorationImage(image: NetworkImage("https://yt3.googleusercontent.com/XTzHGB7Bm3Ph8pipyaV7-UpeQVngLs9PZCNtpZ-T2HYe7380UttfvHUI4c7NYgA1Z1NjcZX-Wm8=s176-c-k-c0x00ffffff-no-rj"),fit: BoxFit.fill)
            ),
          ),
        ),
        if(!statusFollow)
        Positioned(
          bottom: -8,
          child: Container(
          decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(25)),
          child:  InkWell(onTap: (){},child: Icon(Icons.add)),
        ))
      ],
    );
  }

  iconItem(FaIcon icon,String label){
    return Column(children: [
      IconButton(onPressed: (){},
      icon: icon),
      if(label.isNotEmpty) Text(label,style: const TextStyle(color: Colors.white),)
    ],);
  }

    return Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: YoutubePlayer(controller: youtubePlayerController),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  height:MediaQuery.of(context).size.height/4.8,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.bottomLeft,
                        margin: const EdgeInsets.all(5),
                        child: Text(widget.video.author,style: const TextStyle(
                          fontSize: 18,fontWeight: FontWeight.w600,
                          color: Colors.white
                        ),),
                      ),
                      Expanded(
                        child: Container(
                          
                          margin: const EdgeInsets.all(5),
                          child: Text(widget.video.title,style: const TextStyle(
                            fontSize: 15,fontWeight: FontWeight.w600,
                            color: Colors.white
                          ),),
                        ),
                      )
                    ],
                  )
              )),
              
              Expanded(
                child:Container(
                  height:MediaQuery.of(context).size.height/1.75,
                  color: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      profile(),
                      iconItem( const FaIcon(FontAwesomeIcons.solidHeart,color: Colors.white),"1k"),
                      InkWell(
                        onTap: (){},
                        child: iconItem( const FaIcon(FontAwesomeIcons.solidComment,color: Colors.white,),"1k"),
                      ),
                      iconItem( const FaIcon(FontAwesomeIcons.share,color: Colors.white,),""),
                    ],
                  )
                  )
                )
            ],
          )
        ],
      );
  }
}