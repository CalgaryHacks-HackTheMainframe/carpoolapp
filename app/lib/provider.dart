import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'Task.dart';
import 'Course.dart';

class provider extends ChangeNotifier {
  final List<Task> _tasks = [];
  List<Task> get tasks => _tasks;
  DateTime _currDate = DateTime.now();
  DateTime get chosenDate => _currDate;
  List<Task> get taskFromDate => _tasks;
  final List<Course> xcourses = [];
  List<Course> get courses => xcourses;

  void setDate(DateTime date) => _currDate = date;

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void addCourse(Course course) {
    xcourses.add(course);
  }

  void addTtoC(Course c, Task t) {
    c.tasks.add(t);
  }
}
