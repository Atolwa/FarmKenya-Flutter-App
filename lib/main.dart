import 'package:flutter/material.dart';
import 'package:flutter_app/models/category.dart';
import 'package:flutter_app/screens/article_list.dart';
import 'services/api_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.green,
        )
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Category>>(
        future: API.getCategories(),
        builder: (Context, snapshot) {

      if (snapshot.hasError) {
        return Scaffold(
          body: Center(
            child: Text("Ooops! Something went wrong."),
          ),
        );
      }
      if(snapshot.hasData)
      return DefaultTabController(
        length: snapshot.data.length,
        child: Scaffold(
            appBar: AppBar(
              title: Text("FarmKenya",
              style: TextStyle(fontFamily: 'Periodico',
              fontSize: 24.0,
              fontWeight: FontWeight.bold),),
              bottom: TabBar(
                labelStyle: TextStyle(fontFamily: 'Periodico',
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
                isScrollable: true,
                tabs: snapshot.data
                    .map(
                      (e) => Tab(
                        text: e.name,
                      ),
                    )
                    .toList(),
              ),
            ),
            body: TabBarView(
              children: snapshot.data
                  .map(
                    (e) => ArticleListView(
                      category: e,
                    ),
                  )
                  .toList(),
            ),),
      );
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    });

  }
}
