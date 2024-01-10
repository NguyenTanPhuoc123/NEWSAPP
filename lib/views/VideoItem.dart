import 'package:doandidong/model/video.dart';
import 'package:flutter/material.dart';
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
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        Expanded(
            flex: 2,
            child: YoutubePlayer(controller: youtubePlayerController)
            ),
            
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(widget.video.author,style: const TextStyle(
                color: Colors.white,               
                fontSize: 20,
                fontWeight: FontWeight.w600
              )),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(widget.video.title,style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500
                ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}