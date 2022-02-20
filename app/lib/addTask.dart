import 'dart:js';

import 'package:app/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:provider/provider.dart';
import 'package:app/Task.dart';
import 'package:intl/intl.dart';

class addTask extends StatelessWidget {
  final _key = GlobalKey<FormBuilderState>();
  TextEditingController task_i = new TextEditingController();
  TextEditingController course_i = new TextEditingController();
  TextEditingController description_i = new TextEditingController();
  late DateTime fromDate;
  late DateTime toDate;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Student Course Manager',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        home: Scaffold(
          appBar: AppBar(
            leading: BackButton(),
            // actions: buildEditingActions(),
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
              Text("\From:"),
              FormBuilderDateTimePicker(
                name: 'From_time',
                inputType: InputType.both,
                decoration: InputDecoration(
                  labelText: 'Start Time',
                ),
                initialTime: TimeOfDay(hour: 8, minute: 0),
              ),
              Text("\To:"),
              FormBuilderDateTimePicker(
                name: 'To_time',
                inputType: InputType.both,
                decoration: InputDecoration(
                  labelText: 'End Time',
                ),
                initialTime: TimeOfDay(hour: 8, minute: 0),
              ),
              Text("\Description:"),
              Card(
                  color: Colors.white70,
                  child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                        controller: description_i,
                        maxLines: 8,
                        decoration: InputDecoration.collapsed(
                            hintText: "Enter your text here"),
                      ))),
              Row(children: <Widget>[
                Expanded(
                  child: MaterialButton(
                      color: Theme.of(context).colorScheme.secondary,
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        _key.currentState!.save();
                        if (_key.currentState!.validate()) {
                          fromDate = _key.currentState!.value['From_time'];
                          toDate = _key.currentState!.value['To_time'];
                          print(fromDate);
                          print(toDate);
                          saveForm(context);
                        } else {
                          print("validation failed");
                        }
                      }),
                )
              ]),
            ]),
          ),
        ));
  }

  Future saveForm(BuildContext context) async {
    final isValid = _key.currentState!.validate();
    if (isValid) {
      final task = Task(
        name: task_i.text,
        course_name: course_i.text,
        to: toDate,
        from: fromDate,
        description: description_i.text,
      );

      final _provider = Provider.of<provider>(context, listen: false);
      _provider.addTask(task);
      Navigator.of(context).pop();
    }
  }
}
