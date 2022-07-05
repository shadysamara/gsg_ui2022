import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsk_ui/data/dummy_data.dart';
import 'package:gsk_ui/data/new_model.dart';
import 'package:gsk_ui/data/news_app/views/screens/all_news_screen.dart';
import 'package:gsk_ui/data/news_app/views/screens/favourite_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  likeNews(NewsModel newsModel) {
    int index = news.indexOf(newsModel);
    news[index].isLike = !news[index].isLike;
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('News App'),
          bottom: const TabBar(tabs: [
            Tab(
              text: 'ALL',
            ),
            Tab(
              text: 'FAVOURITE',
            )
          ]),
        ),
        body: TabBarView(children: [AllNewsScreen(likeNews), FavouriteScreen(likeNews)]),
      ),
    );
  }
}
