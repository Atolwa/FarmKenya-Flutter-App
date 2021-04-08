import 'package:flutter/material.dart';
import '../models/article.dart';
import '../services/api_service.dart';

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
class MyList extends StatelessWidget{
  MyList({@required this.article});
  Article article;
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new ListTile(
          leading: new MyBullet(),
          title:  Text(article.title,
            style: TextStyle(
              fontFamily: 'Periodico',
              fontWeight: FontWeight.normal,
              fontSize: 18.0,
            ),
          ),
        ),
      ],
    );
  }
}