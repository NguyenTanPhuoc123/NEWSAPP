import 'package:doandidong/control/ControllerVideo.dart';
import 'package:doandidong/model/video.dart';
import 'package:doandidong/views/VideoItem.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webfeed/webfeed.dart';
import 'package:xml/xml.dart'as xml;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';



class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  List<Video> _videos = List.filled(0,Video("","",""),growable: true);
  @override
  void initState() {
    super.initState();
      ControllerVideo.getListVideo().then((value){
        setState(() {
          _videos = ControllerVideo.videos;
        });
      });
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
       body: _videos.isEmpty ? const Center(child: CircularProgressIndicator(),):
       PageView.builder(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        itemCount: _videos.length,
        itemBuilder: (context,index){
          return VideoItem(video: _videos[index]);
        }
      ),
    );
  }
}