import 'package:flutter/material.dart';
import 'package:flutter_app/models/article.dart';
import 'package:flutter_app/screens/article_detail.dart';
import 'package:flutter_app/screens/related_articles_list.dart';

class MainArticle extends StatefulWidget {

  @override
  _MainArticleState createState() => _MainArticleState();
}

class _MainArticleState extends State<MainArticle> {
  Article article;
  int currentIndex=0;

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
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

        body:  SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: ArticleDetailView(),
              ),
              Container(
                child: RelatedArticleListView(),
              ),
            ],
          ),


    )

    );

  }
}
