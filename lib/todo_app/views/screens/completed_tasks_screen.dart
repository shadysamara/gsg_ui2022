import 'package:flutter/material.dart';
import 'package:gsk_ui/todo_app/data/data_repo.dart';
import 'package:gsk_ui/todo_app/views/widgets/task_widget.dart';
import 'package:lottie/lottie.dart';

class CompleteTasksScreen extends StatelessWidget {
  Function function;
  CompleteTasksScreen(this.function);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return 
    tasks.where((element) => element.isComplete).isEmpty?
    Lottie.asset('assets/animations/empty.json'):
    ListView.builder(
        itemCount: tasks.where((element) => element.isComplete).length,
        itemBuilder: (context, index) {
          return TaskWidget(
              tasks.where((element) => element.isComplete).toList()[index],
              function);
        });
  }
}
