import 'package:flutter/material.dart';

class PathNotFound extends StatelessWidget {
  String title;
  PathNotFound(this.title);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Text('page $title not found'),
      ),
    );
  }
}
