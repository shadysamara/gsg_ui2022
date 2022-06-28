import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsk_ui/models/post.dart';

class StoryWidget extends StatelessWidget {
  Post post;
  StoryWidget(this.post);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding:EdgeInsets.symmetric(horizontal: 10),
      child: CircleAvatar(
        radius: 40,
        backgroundImage: NetworkImage(post.image!),
      ),
    );
  }
}
