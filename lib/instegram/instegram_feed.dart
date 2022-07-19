import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsk_ui/data/dummy_data.dart';
import 'package:gsk_ui/instegram/new_post.dart';
import 'package:gsk_ui/instegram/post_widget.dart';
import 'package:gsk_ui/instegram/story_widget.dart';
import 'package:gsk_ui/navigation/router.dart';

class InstegramFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            AppRouter.NavigateToWidget(NewPost());
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(),
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 8,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    return StoryWidget(posts[index].post!);
                  }),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    return PostWidget(posts[index].user!, posts[index].post!);
                  }),
            ),
          ],
        ));
  }
}
