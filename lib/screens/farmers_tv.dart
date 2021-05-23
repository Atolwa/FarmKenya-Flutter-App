import 'package:flutter/material.dart';
import 'package:flutter_app/vids/web_view_container.dart';
import 'package:flutter_app/lifecycle_manager.dart';

class FarmersTV extends StatelessWidget {
  final _links = ['www.dailymotion.com/embed/video/x7opfez'];
  @override
  Widget build(BuildContext context) {
    return LifeCycleManager(
        child: Scaffold(
        body: //SafeArea(
           // child: SingleChildScrollView(
             //   child:// Column(
                 // mainAxisAlignment: MainAxisAlignment.center,
                 // crossAxisAlignment: CrossAxisAlignment.stretch,
                 // _links.map((link) => _urlButton(context, link)).toList(),
                //  children:
                      WebViewContainer('www.dailymotion.com/embed/video/x7opfez'),
                ));
  }
 /* Widget _urlButton(BuildContext context, String url) {
    return Container(
        padding: EdgeInsets.all(20.0),
        child: FlatButton(
          color: Theme.of(context).primaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
          child: Text(url),
          onPressed: () => _handleURLButtonPress(context, url),
        ));
  }
  void _handleURLButtonPress(BuildContext context, String url) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => WebViewContainer(url)));
  }*/
}