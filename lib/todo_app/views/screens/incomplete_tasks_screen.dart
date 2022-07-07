import 'package:flutter/material.dart';
import 'package:gsk_ui/todo_app/data/data_repo.dart';
import 'package:gsk_ui/todo_app/views/widgets/task_widget.dart';

class InCompleteTasksScreen extends StatelessWidget {
 Function function;
  InCompleteTasksScreen(this.function);
 
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: tasks.where((element) => !element.isComplete).length,
        itemBuilder: (context, index) {
          return TaskWidget(
              tasks.where((element) => !element.isComplete).toList()[index],
              function);
        });
  }
}
