import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gsk_ui/data/dummy_data.dart';
import 'package:gsk_ui/data/news_app/views/widgets/news_widget.dart';

class AllNewsScreen extends StatelessWidget {
  Function function;
  AllNewsScreen(this.function);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: news.length,
        itemBuilder: (context, index) {
          return NewsWidget(news[index],function);
        });
  }
}
