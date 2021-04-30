import 'package:flutter/material.dart';
import 'package:flutter_app/models/category.dart';
import 'package:flutter_app/screens/article_detail.dart';
import 'package:flutter_app/services/api_service.dart';
import 'package:flutter_html/style.dart';
import '../models/article.dart';
import 'package:intl/intl.dart';
import 'package:flutter_app/models/related_articles.dart';
import 'package:flutter_app/screens/related_articles_details.dart';


class RelatedArticleListView extends StatelessWidget {
  RelatedArticleListView({@required this.article});

  Article article;
  final endDate= DateTime.now();


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: 8, vertical: 4),
          child: Text(
            "Read more articles:",
            style: TextStyle(
              fontFamily: 'Periodico',
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        FutureBuilder<List<RelatedArticles>>(
          future: API.getRelatedArticles(article.id),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Oops! Something went wrong'),
              );
            }
            if (snapshot.hasData) {
            SizedBox(
              height: 200,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) => MyList(snapshot.data[index]),
              )
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ],
      ),
    );
  }
}


class MyList extends StatelessWidget {
  MyList(this.relatedArticles);

  RelatedArticles relatedArticles;

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
              builder: (context) => RelatedArticleDetailView(relatedArticles: relatedArticles),
            ),
          );

        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 185,
              width: double.infinity,
              child: Image.network(
                relatedArticles.thumbURL,
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(
              height: 4,
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text(
                relatedArticles.title,
                //style: Theme.of(context).textTheme.headline6,
                style: TextStyle(fontFamily: 'Periodico',
                  fontWeight: FontWeight.bold,
                  fontSize:23.0,
                ),

              ),
            ),

            SizedBox(
              height: 6,
            ),
          ],
        ),
      ),
    );
  }
}
