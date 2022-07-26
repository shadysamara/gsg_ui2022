import 'package:flutter/material.dart';
import 'package:gsk_ui/todo_app/models/task_model.dart';

class TaskWidget extends StatelessWidget {
  TaskModel taskModel;
  Function function;
  Function delfunction;
  TaskWidget(this.taskModel, this.function, this.delfunction);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: CheckboxListTile(
        secondary: IconButton(
            onPressed: () {
              delfunction(taskModel);
            },
            icon: Icon(Icons.delete)),
        value: taskModel.isComplete,
        onChanged: (v) {
          function(taskModel);
        },
        title: Text(taskModel.title!),
      ),
    );
  }
}
