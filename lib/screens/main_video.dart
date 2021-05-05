import 'package:flutter/material.dart';
import 'package:flutter_app/models/article.dart';
import 'package:flutter_app/models/related_articles.dart';
import 'package:flutter_app/models/video.dart';
import 'package:flutter_app/services/api_service.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_app/screens/related_articles_list.dart';
import 'package:flutter_app/vids/web_view_container.dart';

class MainVideo extends StatelessWidget {
  MainVideo({@required this.video});

  Video video;
  int currentIndex=0;


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
    return Scaffold(

      body:
      Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: FutureBuilder<Video>(
              future: API.getVideo(video.id),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("Ooops! Something went wrong."),
                  );
                }
                if (snapshot.hasData) {
                  video = snapshot.data;

                  return  WebViewContainer(video.videoURL);


                }
              }
          )

      ),


    );
  }
}
