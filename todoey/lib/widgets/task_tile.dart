import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  bool isChecked;
  String taskTitle;

  TaskTile({super.key, required this.taskTitle, required this.isChecked});

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: widget.isChecked,
        onChanged: (newValue) {
          setState(() {
            widget.isChecked = newValue as bool;
          });
        },
      ),
      title: Text(
        widget.taskTitle,
        style: TextStyle(
          decoration: widget.isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
    );
  }
}
