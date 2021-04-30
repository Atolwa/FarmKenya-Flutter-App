import 'package:flutter/material.dart';
import 'package:flutter_app/models/category.dart';
import 'package:flutter_app/screens/article_list.dart';
import 'package:flutter_app/screens/homescreen.dart';
import 'package:flutter_app/services/api_service.dart';
import 'package:flutter_app/screens/homepage.dart';
import 'package:flutter_app/screens/ftv.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex=0;

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: <Widget>[
        MyHomePage(),
       HomeScreen(),
        Ftv(),
        Container(
          color: Colors.yellow,
        ),
        Container(
          color: Colors.green,
        ),
      ][currentIndex],
        bottomNavigationBar:BottomNavigationBar(
          onTap:changePage,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.green,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(.60),
          selectedFontSize: 14,
          unselectedFontSize: 14,


          items: [
            BottomNavigationBarItem(
              title: Text('Home'),
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              title: Text('Videos'),
              icon: Icon(Icons.ondemand_video_outlined),
            ),
            BottomNavigationBarItem(
              title: Text('Farmers TV'),
              icon: Icon(Icons.tv),
            ),
          ],
        )
    );

  }
}





