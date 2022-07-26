import 'package:flutter/material.dart';
import 'package:gsk_ui/navigation/router.dart';
import 'package:gsk_ui/todo_app/views/screens/main_screen.dart';
import 'package:gsk_ui/validation_ex/sp_helper.dart';

class SplachScreen extends StatelessWidget {
  initFun() async {
    await Future.delayed(Duration(seconds: 3));
    AppRouter.NavigateWithReplacemtnToWidget(MainTodoPage());
  }

  @override
  Widget build(BuildContext context) {
    initFun();
    // TODO: implement build
    return const Scaffold(
      body: Center(
        child: FlutterLogo(),
      ),
    );
  }
}
