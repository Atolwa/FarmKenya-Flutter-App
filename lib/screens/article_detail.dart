import 'package:flutter/material.dart';
import 'package:flutter_app/models/article.dart';
import 'package:flutter_app/services/api_service.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import '../screens/bullet_list.dart';

class MyBullet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 20.0,
      width: 20.0,
      decoration: new BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}

class ArticleDetailView extends StatelessWidget {
  ArticleDetailView({@required this.article});

  Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FarmKenya",
          style: TextStyle(fontFamily: 'Periodico',
              fontSize: 24.0,
              fontWeight: FontWeight.bold),),

      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: FutureBuilder<Article>(
          future: API.getArticle(article.id),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Ooops! Something went wrong."),
              );
            }
            if (snapshot.hasData) {
              article = snapshot.data;
              article.story = article.story.replaceAll(
                  "src=\"", "src=\"https://cdn.standardmedia.co.ke");
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      article.title,textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Periodico',
                        fontWeight: FontWeight.bold,
                        fontSize: 23.0,
                      ),
                      //style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Text(article.author, style: TextStyle(color: Colors.grey),),
                          //Text(article.publishdate, style: TextStyle(color: Colors.grey),),
                        ],
                      ),
                    ),
                    Html(
                      data: article.story,
                      style: {
                        "body": Style(
                          fontFamily: 'Periodico',
                          fontSize: FontSize(18.0),
                          textAlign: TextAlign.left,
                        ),
                      },
                      // style: TextStyle(fontFamily: 'Periodico',),
                    ),
                    /*Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      child: Text(
                        "Read more articles:",
                        style: TextStyle(
                          fontFamily: 'Periodico',
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4) ,
                      child: MyList(),
                    ),*/
                  ],
                ),

              );
            }
          },
        ),
      ),
    );
  }
}
