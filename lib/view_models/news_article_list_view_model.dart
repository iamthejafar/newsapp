

import 'package:flutter/cupertino.dart';
import 'package:newsapp/services/webservice.dart';
import 'package:newsapp/view_models/news_article_view_model.dart';

import '../models/news_article_model.dart';
enum LoadingStatus{
  completed,
  searching,
  empty
}
class NewsArticleListViewModel extends ChangeNotifier{


  var loadingStatus = LoadingStatus.searching;
  List<NewsArticleViewModel> newsArticleModels = [];

  void populateSearchHeadline(String kw) async{
    loadingStatus = LoadingStatus.searching;
    // notifyListeners();

    List<NewsArticleModel> newsArticleModels = await WebService().fetchHeadLinesByKw(kw);
    this.newsArticleModels = newsArticleModels.map((article) => NewsArticleViewModel(articleModel: article)).toList();

    this.loadingStatus = newsArticleModels.isEmpty ?LoadingStatus.empty:LoadingStatus.completed;
    notifyListeners();

  }


  void populateTopHeadline() async{
    loadingStatus = LoadingStatus.searching;
    // notifyListeners();
    List<NewsArticleModel> newsArticleModels = await WebService().fetchTopHeadlines();
    this.newsArticleModels = newsArticleModels.map((articleModel) => NewsArticleViewModel(articleModel: articleModel)).toList();
    this.loadingStatus = newsArticleModels.isEmpty ?LoadingStatus.empty:LoadingStatus.completed;

    notifyListeners();
  }
}