import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gsk_ui/data/dummy_data.dart';
import 'package:gsk_ui/data/news_app/views/widgets/news_widget.dart';

class FavouriteScreen extends StatelessWidget {
  Function function;
  FavouriteScreen(this.function);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: news.where((element) => element.isLike).length,
        itemBuilder: (context, index) {
          return NewsWidget(
              news.where((element) => element.isLike).toList()[index],function);
        });
  }
}
