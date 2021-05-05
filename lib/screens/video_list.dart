import 'package:flutter/material.dart';
import 'package:flutter_app/screens/video_items.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_app/services/api_service.dart';
import 'package:flutter_app/models/video.dart';
import 'package:flutter_app/vids/web_view_container.dart';
import 'package:flutter_app/screens/main_video.dart';

class VideoList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          title: Text(
            "FarmKenya",
            style: TextStyle(
                fontFamily: 'Periodico',
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          ),
        ),
    body: Container(
      child: FutureBuilder<List<Video>>(
        future: API.getVideos(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Oops! Something went wrong'),
            );
          }
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) => MyCard(snapshot.data[index]),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    )
    );
    /* return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('FarmKenya'),
        centerTitle: false,
      ),
      body: ListView(
        children: <Widget>[

          VideoItems(
            videoPlayerController: VideoPlayerController.network(
                'https://www.youtube.com/embed/zN1oIA6WCtc'
            ),
           // looping: false,
           // autoplay: true,
          ),
          Text(data)

        ],
      ),
    );*/
  }
}

class MyCard extends StatelessWidget {
  MyCard(this.video);

  Video video;

  static String calculateTimeDifferenceBetween(
      {@required DateTime publishdate, @required DateTime endDate}) {
    int seconds = endDate.difference(publishdate).inSeconds;
    if (seconds < 60)
      return '$seconds seconds ago';
    else if (seconds >= 60 && seconds < 3600)
      return '${publishdate.difference(endDate).inMinutes.abs()} minutes ago';
    else if (seconds >= 3600 && seconds < 86400)
      return '${publishdate.difference(endDate).inHours} hours ago';
    else
      return '${publishdate.difference(endDate).inDays} days ago';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
        onTap: () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MainVideo(video:video),
        ),
      );
    },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
            color: Colors.black,
           height: 150,

            //width: 50,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),

            child: Text(
              video.title,
              style: TextStyle(
                fontFamily: 'Periodico',
                fontWeight: FontWeight.bold,
                fontSize: 23.0,
              ),
            ),
          ),




        ],
      ),
        )
    );
  }
}
