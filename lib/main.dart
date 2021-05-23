import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/category.dart';
import 'package:flutter_app/screens/article_list.dart';
import 'services/api_service.dart';
import 'package:flutter_app/home.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter_app/lifecycle_manager.dart';


void main() {

  runApp(MyApp());

}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return LifeCycleManager(
      child:MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.green,
        )
      ),
      home: new MySplash(),
      //Home(),
    ));
  }
}
class MySplash extends StatefulWidget {
  @override
  _MySplashState createState() => new _MySplashState();
}

class _MySplashState extends State<MySplash> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 8,
        navigateAfterSeconds: new AfterSplash(),
        title: new Text('FarmKenya Initiative - The Standard',
          style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0
          ),),
        image: new Image.asset('assets/logo/fklogo.png'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: ()=>print("FarmKenya"),
        loaderColor: Colors.red
    );
  }
}
class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      body: Home(),
    );
  }
}

