import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsk_ui/navigation/router.dart';
import 'package:gsk_ui/navigation/screens/screen2.dart';

class Screen1 extends StatelessWidget {
  static const String screenName = 'screen1';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: () {
        if (Navigator.canPop(context)) {
          Navigator.pop(context, 'hello');
          return Future.value(true);
        } else {
          log('this is te last screen, you cant pop more');
          return Future.value(false);
        }
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text('Screen1'),
          ),
          body: Center(
            child: ElevatedButton(
                child: Text('go to screen 2'),
                onPressed: () async {
                  AppRouter.NavigateToWidget(Screen2('title'));
                  // String x = await Navigator.push(context,
                  //     MaterialPageRoute(builder: ((context) {
                  //   return Screen2('hello');
                  // })));
                  // print('the message that i recived from other screen is $x');
                }),
          )),
    );
  }
}
