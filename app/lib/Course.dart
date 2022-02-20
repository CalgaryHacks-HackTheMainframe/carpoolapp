import 'Task.dart';

class Course {
  final String courseName;
  final List<Task> tasks;
  const Course({
    required this.courseName,
    required this.tasks,
  });
}
