import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'Task.dart';

class provider extends ChangeNotifier {
  final List<Task> _tasks = [];
  List<Task> get taskFromDate => _tasks;
  List<Task> get tasks => _tasks;
  DateTime _currDate = DateTime.now();
  DateTime get chosenDate => _currDate;

  void setDate(DateTime date) => _currDate = date;
  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }
}