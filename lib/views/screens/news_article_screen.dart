import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:newsapp/view_models/news_article_view_model.dart';


class NewsArticleScreen extends StatelessWidget {
   NewsArticleScreen({Key? key, required this.article}) : super(key: key);

  final NewsArticleViewModel article;
  late InAppWebViewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse(article.url)),
      )
    );
  }
}
