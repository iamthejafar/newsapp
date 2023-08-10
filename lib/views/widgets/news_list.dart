import 'package:flutter/material.dart';

import '../../view_models/news_article_view_model.dart';

class NewsList extends StatelessWidget {
  NewsList({Key? key, required this.articles, this.onSelected}) : super(key: key);
  final List<NewsArticleViewModel> articles;
  Function(NewsArticleViewModel article)? onSelected;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: articles.length,
      separatorBuilder: (context,index){
        return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(thickness: 2.0,)
        );
      },
      itemBuilder: (context,index){
        final article = articles[index];
        return ListTile(
          onTap: (){
            onSelected!(article);
          },
          leading: Container(
              height: 100,
              width: 100,
              child: article.imageUrl=="" ? Icon(Icons.downloading_outlined) :
              Image.network(article.imageUrl.toString())
          ),
          title: Text(article.title),
        );
      },
    );
  }
}
