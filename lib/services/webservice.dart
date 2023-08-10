
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/models/news_article_model.dart';
import 'package:newsapp/utils/constants.dart';

class WebService{


  Future fetchHeadLinesByKw(String kw)async{
    var url = Uri.parse(Constants.healinesFor(kw));
    final response = await http.get(url);

    if(response.statusCode == 200){
      final result = jsonDecode(response.body);
      print(result);
      Iterable list = result['articles'];
      return list.map((article)=>NewsArticleModel.fromJson(article)).toList();
    }
    else{
      throw Exception("unable to find news about kw");
    }
  }
  Future<List<NewsArticleModel>> fetchTopHeadlines() async{
    var url = Uri.parse(Constants.TOP_HEADLINES_URL);
    final response = await http.get(url);

    if(response.statusCode==200){
      var result = jsonDecode(response.body);
      Iterable list = result['articles'];
      return list.map((article) => NewsArticleModel.fromJson(article)).toList();
    } else{
      throw Exception('Unable to fetch headlines.');

    }


  }
}