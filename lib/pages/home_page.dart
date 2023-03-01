import 'package:flutter/material.dart';
import 'package:todo_app/utils/add_dialog.dart';
import 'package:todo_app/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

  List todoList = [
    ["make tutorial", false],
  ];

  void toggle(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  void addTask() {
    setState(() {
      todoList.add([_controller.text, false]);
      Navigator.of(context).pop();
    });
    _controller.clear();
  }

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

  void deleteTask(int index) {
    setState(() {
      todoList.removeAt(index);
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
        
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: todoList[index][0],
            taskCompleted: todoList[index][1],
            onchanged: (value) => toggle(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
