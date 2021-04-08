import 'package:flutter/material.dart';
import 'package:flutter_app/models/category.dart';
import 'package:flutter_app/screens/article_detail.dart';
import 'package:flutter_app/services/api_service.dart';
import 'package:flutter_html/style.dart';
import '../models/article.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';


class ArticleListView extends StatelessWidget {
  ArticleListView({@required this.category});

  Category category;


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
                  Text(' ${DateFormat('dd-MM-yyyy').format(article.publishdate,)}',
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
