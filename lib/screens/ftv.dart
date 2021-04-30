import 'package:flutter/material.dart';
import 'package:flutter_app/screens/video_items.dart';
import 'package:video_player/video_player.dart';

class Ftv extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('FarmKenya'),
        centerTitle: false,
      ),
      body:

          VideoItems(
            videoPlayerController: VideoPlayerController.network(
                'www.dailymotion.com/embed/video/x7opfez'
            ),
            // looping: false,
            // autoplay: true,
          ),


    );
  }

}