import 'package:flutter/material.dart';
import 'package:todo_app/utils/add_delete_button.dart';

// ignore: must_be_immutable
class AddDialog extends StatelessWidget {
  final controller;
  VoidCallback save;
  VoidCallback cancel;
  AddDialog(
      {super.key,
      required this.controller,
      required this.cancel,
      required this.save});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 120,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(),
                  border: OutlineInputBorder(),
                  labelText: "Add task",
                  labelStyle: TextStyle(color: Colors.black26),
                  hintText: "Add a new task"),
            ),
            const SizedBox(
              height: 13,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonsBox(
                  text: "Add",
                  onPressed: save,
                ),
                const SizedBox(
                  width: 13,
                ),
                ButtonsBox(
                  text: "Cancel",
                  onPressed: cancel,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
