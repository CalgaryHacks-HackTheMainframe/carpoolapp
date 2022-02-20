import 'package:flutter/foundation.dart';

import 'package:flutter/cupertino.dart';
import 'Task.dart';

class provider extends ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }
}
