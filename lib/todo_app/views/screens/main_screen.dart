import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gsk_ui/todo_app/data/data_repo.dart';
import 'package:gsk_ui/todo_app/data/db_helper.dart';
import 'package:gsk_ui/todo_app/data/file_helper.dart';
import 'package:gsk_ui/todo_app/models/task_model.dart';
import 'package:gsk_ui/todo_app/views/screens/all_tasks_screen.dart';
import 'package:gsk_ui/todo_app/views/screens/completed_tasks_screen.dart';
import 'package:gsk_ui/todo_app/views/screens/incomplete_tasks_screen.dart';
import 'package:gsk_ui/todo_app/views/screens/new_task_screen.dart';

class MainTodoPage extends StatefulWidget {
  @override
  State<MainTodoPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainTodoPage>
    with SingleTickerProviderStateMixin {
  getAllTasks() async {
    tasks = await DbHelper.dbHelper.selectAllTasks();
    setState(() {});
  }

  changeTaskStatus(TaskModel taskModel) {
    TaskModel t = taskModel;
    int index = tasks.indexOf(taskModel);
    log(t.toMap().toString());
    tasks[index].isComplete = !tasks[index].isComplete;
    log(t.toMap().toString());
    DbHelper.dbHelper.updateOneTask(taskModel);
    setState(() {});
  }

  removeTask(TaskModel taskModel) {
    tasks.remove(taskModel);
    DbHelper.dbHelper.deleteOneTask(taskModel.id!);
    setState(() {});
  }

  setStateAfterAddNewTask() {
    setState(() {});
  }

  TabController? tabController;
  initTabBar() {
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initTabBar();
    getAllTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo app'),
        bottom: TabBar(controller: tabController!, tabs: const [
          Tab(
            icon: Icon(Icons.list),
          ),
          Tab(
            icon: Icon(Icons.done),
          ),
          Tab(
            icon: Icon(Icons.cancel),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FileHelper.fileHelper.readFromFile();
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: ((context) =>
          //             NewTaskScreen(setStateAfterAddNewTask))));
        },
      ),
      body: TabBarView(controller: tabController!, children: [
        AllTasksScreen(changeTaskStatus, removeTask),
        CompleteTasksScreen(changeTaskStatus, removeTask),
        InCompleteTasksScreen(changeTaskStatus, removeTask)
      ]),
    );
  }
}
