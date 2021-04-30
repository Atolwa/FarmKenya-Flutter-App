import 'package:flutter/material.dart';
import 'package:flutter_app/models/article.dart';
import 'package:flutter_app/models/related_articles.dart';
import 'package:flutter_app/services/api_service.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_app/screens/related_articles_list.dart';
import 'package:flutter_app/screens/article_detail.dart';



class ArticleDetail extends StatefulWidget {
  ArticleDetail({@required this.article});
  Article article;

  @override
  _ArticleDetailState createState() => _ArticleDetailState();
}

class _ArticleDetailState extends State<ArticleDetail> {
  int currentIndex=0;
  Article article;


  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }
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
      appBar: AppBar(
        title: Text(
          "FarmKenya",
          style: TextStyle(
              fontFamily: 'Periodico',
              fontSize: 24.0,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: <Widget>[
        ArticleDetailView(article: article),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: 8, vertical: 4),

          child: RelatedArticleListView(article: article),
        ),
      ][currentIndex],
    );
  }
}
