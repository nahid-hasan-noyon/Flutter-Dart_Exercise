import 'package:flutter/material.dart';
import 'package:todoey/modals/task.dart';
import 'package:todoey/widgets/task_tile.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  const TaskList({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          taskTitle: tasks[index].name,
          isChecked: tasks[index].isDone,
        );
      },
      itemCount: tasks.length,
    );
  }
}
