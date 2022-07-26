import 'package:gsk_ui/todo_app/data/db_helper.dart';

class TaskModel {
  int? id;
  String? title;
  late bool isComplete;
  TaskModel({
    required this.title,
    this.isComplete = false,
  });
  TaskModel.fromMap(Map<String, dynamic> map) {
    id = map[DbHelper.taskIdColumName];
    title = map[DbHelper.taskNameColumName];
    isComplete = map[DbHelper.taskIsCompleteColumName] == 1 ? true : false;
  }
  Map<String, dynamic> toMap() {
    return {
      DbHelper.taskNameColumName: title,
      DbHelper.taskIsCompleteColumName: (isComplete!) ? 1 : 0
    };
  }
}
