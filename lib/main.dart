import 'package:flutter/material.dart';
import 'package:newsapp/view_models/news_article_list_view_model.dart';
import 'package:newsapp/view_models/news_article_view_model.dart';
import 'package:newsapp/views/screens/home_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => NewsArticleListViewModel(),
        child: HomeScreen(),
      )
    );
  }
}
