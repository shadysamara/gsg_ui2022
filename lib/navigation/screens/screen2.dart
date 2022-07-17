import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  static const String screenName = 'screen2';
  String title;
  Screen2(this.title);

  @override
  Widget build(BuildContext context) {
  String? x =   ModalRoute.of(context)?.settings.arguments.toString();
    // TODO: implement build
    return WillPopScope(
      onWillPop: () {
        if (Navigator.canPop(context)) {
          Navigator.pop(context, 'hello');
          return Future.value(true);
        } else {
          return Future.value(false);
        }
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text('Screen2'),
          ),
          body: Center(
            child: ElevatedButton(
                child: Text('go back to screen 1'),
                onPressed: () {
                  Navigator.pop(context, 'this data came back from screen2');
                }),
          )),
    );
  }
}
