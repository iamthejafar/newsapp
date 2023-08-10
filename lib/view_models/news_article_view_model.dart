import 'package:newsapp/models/news_article_model.dart';


class NewsArticleViewModel{
  NewsArticleModel _newsArticleModel;
  NewsArticleViewModel({required NewsArticleModel articleModel}): _newsArticleModel = articleModel;

  String get title{
    return _newsArticleModel.title;
  }

  String get url{
    return _newsArticleModel.url;
  }

  String? get imageUrl{
    return _newsArticleModel.imageUrl;
  }

  String get description{
    return _newsArticleModel.description;
  }

}