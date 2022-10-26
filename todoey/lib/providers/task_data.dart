import 'package:flutter/foundation.dart';
import 'package:todoey/modals/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: 'first'),
    Task(name: 'first2'),
    Task(name: 'first3'),
  ];

  int get taskCount {
    return tasks.length;
  }
}
