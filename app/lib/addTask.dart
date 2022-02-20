import 'package:flutter/material.dart';

class addTask extends StatelessWidget {
  TextEditingController task_i = new TextEditingController();
  TextEditingController course_i = new TextEditingController();

  createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Add Task"),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  controller: task_i,
                  decoration: InputDecoration(hintText: 'Name of Task'),
                ),
                TextFormField(
                  controller: course_i,
                  decoration: InputDecoration(hintText: 'Course Name'),
                ),
                Text("\nSubTasks:"),
              ],
            ),
            actions: <Widget>[
              MaterialButton(child: Text("Submit"), onPressed: () {})
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      body: Builder(builder: (context) {
        return Container(
            child: Center(
                child: FlatButton(
          padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          color: Colors.blueGrey,
          onPressed: () {
            createAlertDialog(context);
          },
          child: Text("Alert"),
        )));
      }),
    ));
  }
}
