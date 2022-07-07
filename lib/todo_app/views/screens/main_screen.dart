import 'package:flutter/material.dart';
import 'package:gsk_ui/todo_app/data/data_repo.dart';
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
  changeTaskStatus(TaskModel taskModel) {
    int index = tasks.indexOf(taskModel);
    tasks[index].isComplete = !tasks[index].isComplete;
    setState(() {});
  }

  removeTask(TaskModel taskModel) {
    tasks.remove(taskModel);

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
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) =>
                      NewTaskScreen(setStateAfterAddNewTask))));
        },
      ),
      body: TabBarView(controller: tabController!, children: [
        AllTasksScreen(changeTaskStatus),
        CompleteTasksScreen(changeTaskStatus),
        InCompleteTasksScreen(changeTaskStatus)
      ]),
    );
  }
}
