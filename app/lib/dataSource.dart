import 'Task.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class DataSource extends CalendarDataSource {
  DataSource(List<Task> source) {
    this.appointments = source;
  }

  Task getTask(int n) => appointments![n] as Task;
  @override
  DateTime getStartTime(int n) => getTask(n).from;
  @override
  DateTime getEndTime(int n) => getTask(n).to;
  @override
  String getSubject(int n) => getTask(n).name;
  @override
  String getNotes(int n) => getTask(n).description;
  @override
  String getcourse(int n) => getTask(n).course_name; //not sure how to get this
}
