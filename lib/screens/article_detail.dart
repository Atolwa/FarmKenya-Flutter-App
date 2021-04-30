import 'package:flutter/material.dart';
import 'package:flutter_app/models/article.dart';
import 'package:flutter_app/models/related_articles.dart';
import 'package:flutter_app/services/api_service.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_app/screens/related_articles_list.dart';

class ArticleDetailView extends StatelessWidget {
  ArticleDetailView({@required this.article});

  Article article;
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
      appBar: AppBar(
        title: Text(
          "FarmKenya",
          style: TextStyle(
              fontFamily: 'Periodico',
              fontSize: 24.0,
              fontWeight: FontWeight.bold),
        ),
      ),

      body:
      Container(
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
                            article.title,
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
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  article.author,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'Periodico',
                                  ),
                                ),
                                Text(
                                  calculateTimeDifferenceBetween(
                                      publishdate: article.publishdate,
                                      endDate: DateTime.now()),
                                  //DateTime.now().difference(article.publishdate).inDays.toString(),
                                  // ' ${DateFormat('dd-MM-yyyy').format(article.publishdate,)}',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'Periodico',
                                  ),
                                ),
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
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),

                            child: RelatedArticleListView(article: article),
                          ),

                        ]),



                  );
                }
              }
              )

      ),


    );
  }
}
