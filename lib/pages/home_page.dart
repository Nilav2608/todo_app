import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/database/services.dart';
import 'package:todo_app/models/model.dart';
import 'package:todo_app/utils/add_dialog.dart';
import 'package:todo_app/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  Task db = Task();

  final _myBox = Hive.box('mybox');

  //*Check box
  void toggle(bool? value, int index) {
    setState(() {
      db.todoList[index][2] = !db.todoList[index][2] ;
      // check = !check;
    });
  }

  //*Add task
  addTask() async {
    setState(() {
      db.todoList.add([_controller.text, false]);
    });
    Navigator.of(context).pop();
  }

  // @override
  // void initState() {
  //   getAllUserDetails();
  //   super.initState();
  // }

  // //*get users from data base
  // getAllUserDetails() async {
  //   var users = await _userService.readAllUsers();
  //   _todoList = <Task>[];
  //   users.forEach((user) {
  //     setState(() {
  //       var taskModel = Task();
  //       taskModel.id = user['id'];
  //       taskModel.taskTitle = user['taskTitle'];
  //       taskModel.finished = user['finished'];
  //       _todoList.add(taskModel);
  //     });
  //   });
  // }

  //*Create a new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return AddDialog(
          controller: _controller,
          save: addTask,
          cancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  //*Delete a task

  deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade200,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Center(child: Text("TODO")),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          createNewTask();
        },
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: db.todoList[index][0],
            taskCompleted: db.todoList[index][1],
            onchanged: (value) => toggle(value, index),
            deleteFunction: (contex) => deleteTask(index),
          );
          // return ListTile(
          //   title: Text(_todoList[index].taskTitle ?? ''),
          // );
        },
      ),
    );
  }
}
