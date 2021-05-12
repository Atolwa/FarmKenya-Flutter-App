import 'package:flutter/material.dart';
import 'package:flutter_app/models/article.dart';
import 'package:flutter_app/models/related_articles.dart';
import 'package:flutter_app/screens/article_detail.dart';
import 'package:flutter_app/screens/related_articles_list.dart';

class MyArticle extends StatefulWidget {
  @override
  _MyArticleState createState() => _MyArticleState();
}

class _MyArticleState extends State<MyArticle> {
  @override
  Widget build(BuildContext context) {
    Article article;
    RelatedArticles relatedArticles;
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
      body: Column(
        children: [
          Container(

          ),

        ],
      ),
    );
  }
}
