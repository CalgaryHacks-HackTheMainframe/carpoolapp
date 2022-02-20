import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:provider/provider.dart';
import 'package:app/Task.dart';

class addTask extends StatelessWidget {
  final _key = GlobalKey<FormBuilderState>();
  TextEditingController task_i = new TextEditingController();
  TextEditingController course_i = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Course Manager',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Add New Task"),
        ),
        body: FormBuilder(
          key: _key,
          child: Column(children: [
            TextFormField(
              controller: task_i,
              decoration: InputDecoration(hintText: 'Name of Task'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              controller: course_i,
              decoration: InputDecoration(hintText: 'Course Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            FormBuilderDateRangePicker(
              name: 'date_range',
              firstDate: DateTime(1970),
              lastDate: DateTime(2030),
              decoration: InputDecoration(
                labelText: 'Start Date-Due Date',
              ),
            ),
            FormBuilderDateTimePicker(
              name: 'date',
              inputType: InputType.time,
              decoration: InputDecoration(
                labelText: 'Deadline Time',
              ),
              initialTime: TimeOfDay(hour: 8, minute: 0),
            ),
            Text("\nSubTasks:\n"),
            ElevatedButton(
                onPressed: () {
                  //Send values
                },
                child: const Text('Submit'))
          ]),
        ),
      ),
    );
  }
}

// class add_task extends StatefulWidget {
//   final Task? task;

//   const add_task({
//     Key? key,
//     this.task,
//   }) : super(key: key);

//   @override
//   task_state createState() => task_state();
// }

// class task_state extends State<add_task> {
//   late DateTime fromDate;

//   @override
//   Widget build(BuildContext context) {
//     Scaffold();
//   }
// }
