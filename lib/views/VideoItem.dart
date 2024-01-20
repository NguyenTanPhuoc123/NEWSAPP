import 'package:doandidong/control/ControllerOfficial.dart';
import 'package:doandidong/control/ControllerUserLogin.dart';
import 'package:doandidong/model/video.dart';
import 'package:doandidong/views/AlertDialog.dart';
import 'package:doandidong/views/officialScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';
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
                child: SizedBox(
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                      onPressed: () async{
                        if(ControllerUserLogin.isLogin){
                      await Share.share("${widget.video.title}\n\n${widget.video.urlVideo}");
                        }else{
                          showDialogLogin(context);
                        }
                      },
                    icon: const FaIcon(FontAwesomeIcons.share,color: Colors.white,size: 22,),
                  ),
                  
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