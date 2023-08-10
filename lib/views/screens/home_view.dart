

import 'package:flutter/material.dart';
import 'package:newsapp/view_models/news_article_list_view_model.dart';
import 'package:newsapp/views/screens/news_article_screen.dart';
import 'package:provider/provider.dart';

import '../widgets/news_list.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final kwController = TextEditingController();
  @override
  void initState() {
    Provider.of<NewsArticleListViewModel>(context,listen: false).populateTopHeadline();
    super.initState();
  }

  Widget _buildList(BuildContext context, NewsArticleListViewModel vm){
    if(vm.loadingStatus == LoadingStatus.searching){
      return Center(child: CircularProgressIndicator(),);
    }
    else if(vm.loadingStatus == LoadingStatus.empty){
      return Center(child: Text('No result found.'),);
    }
    else{
      return  Expanded(
        child: vm.newsArticleModels.isNotEmpty ? NewsList(
            articles: vm.newsArticleModels,
          onSelected: (article){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsArticleScreen(article: article,)));
          },
        ):Text('No result found.'),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NewsArticleListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Top News'),
      ),
      body: Column(
        children: [
          TextField(
            controller: kwController,
            onSubmitted: (kw){
              vm.populateSearchHeadline(kw);

            },
            decoration: InputDecoration(
              labelText: "Search News...",
              icon: Padding(
                padding: EdgeInsets.only(left: 10),
                  child: Icon(Icons.search)
              ),
              suffixIcon: IconButton(
                icon: Icon(Icons.close),
                onPressed: (){
                  kwController.clear();
                },
              )
            ),
          ),
          _buildList(context,vm)


        ],
      )
    );
  }
}
