import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:gsk_ui/data/news_app/views/screens/all_news_screen.dart';
import 'package:gsk_ui/data/news_app/views/screens/main_screen.dart';
import 'package:gsk_ui/instegram/instegram_feed.dart';
import 'package:gsk_ui/my_first_ui.dart';
import 'package:gsk_ui/screen2.dart';
import 'package:gsk_ui/todo_app/views/screens/main_screen.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  bool isDark = false;
  changeTheme(bool value) {
    isDark = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      home: OfflineBuilder(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'There are no bottons to push :)',
            ),
            new Text(
              'Just turn off your internet.',
            ),
          ],
        ),
        connectivityBuilder: (BuildContext context,
          ConnectivityResult connectivity, Widget child) {
        if (connectivity == ConnectivityResult.wifi) {
          return MainTodoPage();
        } else {
          return Scaffold(body: Center(child:Text('Offline')));
        }
      }),
    );
  }
}
