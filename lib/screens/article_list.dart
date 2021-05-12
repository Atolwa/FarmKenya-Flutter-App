import 'package:flutter/material.dart';
import 'package:flutter_app/models/category.dart';
import 'package:flutter_app/screens/article_detail.dart';
import 'package:flutter_app/services/api_service.dart';
import 'package:flutter_html/style.dart';
import '../models/article.dart';
import 'package:intl/intl.dart';
import 'package:flutter_app/screens/related_articles_list.dart';
import 'package:flutter_app/models/related_articles.dart';
import 'package:flutter_app/screens/related_articles_details.dart';


class ArticleListView extends StatelessWidget {
  ArticleListView({@required this.category});

  Category category;
  final endDate= DateTime.now();


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: FutureBuilder<List<Article>>(
        future: API.getArticles(category.id),
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
    );
  }
}


class MyCard extends StatelessWidget {
  MyCard(this.article);

  Article article;
  RelatedArticles relatedArticles;

  static String calculateTimeDifferenceBetween(
      {@required DateTime publishdate, @required DateTime endDate}) {
    int seconds = endDate.difference(publishdate).inSeconds;
    int week= (seconds/604800).floor();
    int month =(seconds/2592000).floor();
    int year = (seconds/31536000).floor();
    if (seconds < 60)
      return '$seconds seconds ago';
    else if (seconds >= 60 && seconds < 3600)
      return '${publishdate.difference(endDate).inMinutes.abs()} minute(s) ago';
    else if (seconds >= 3600 && seconds < 86400)
      return '${-publishdate.difference(endDate).inHours} hour(s) ago';
    else if(seconds >= 86400 && seconds < 604800)
      return '${-publishdate.difference(endDate).inDays} day(s) ago';
    else if(seconds >= 604800 && seconds <2592000)
      return '$week week(s) ago';
    else if(seconds >= 2592000 && seconds <31536000)
      return '$month month(s) ago';
    else
      return '$year year(s) ago';

  }
 String dateDiff(@required DateTime publishdate){
  DateTime start = publishdate;
  DateTime end = DateTime.now();
  Duration difference = end.difference(start);
  print(difference.inDays);

}
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ArticleDetailView(article: article),
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
                article.thumbURL,
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Container(

              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    article.author,
                    style: TextStyle(color: Colors.grey, fontFamily: 'Periodico',),
                  ),
                  Text(
                    //dateDiff(publishdate:article.publishdate),
                    (calculateTimeDifferenceBetween(publishdate: article.publishdate, endDate: DateTime.now())),
                    //DateTime.now().difference(article.publishdate).inDays.toString(),
                   // ' ${DateFormat('dd-MM-yyyy').format(article.publishdate,)}',
                    style: TextStyle(color: Colors.grey,fontFamily: 'Periodico',),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text(
                article.title,
                //style: Theme.of(context).textTheme.headline6,
               style: TextStyle(fontFamily: 'Periodico',
                 fontWeight: FontWeight.bold,
                 fontSize:23.0,
               ),

              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text(
                article.summary,
                style: TextStyle(fontFamily: 'Periodico',
                fontWeight: FontWeight.normal,
                fontSize:18.0,
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
