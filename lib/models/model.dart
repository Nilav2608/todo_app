import 'package:hive_flutter/hive_flutter.dart';

class Task {
  List todoList = [];

  final _myBox = Hive.box('myBox');

  void createInitialData() {
    todoList = [
      ['Reading', false],
      ['Writing', false],
    ];
  }

  void loadData() {
    todoList = _myBox.get("TODOLIST");
  }

  void updateDataBase() {
    _myBox.put("TODOLIST", todoList);
  }
}
