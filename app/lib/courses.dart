import 'package:app/Course.dart';
import 'package:flutter/material.dart';

class courses extends StatefulWidget {
  @override
  mycourses createState() => mycourses();
}

class mycourses extends State<courses> {
  List<Course> _courses = [];
  createAlertDialog(BuildContext context) {
    TextEditingController name = new TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Add Course"),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  controller: name,
                  decoration: InputDecoration(hintText: 'Name of Task'),
                )
              ],
            ),
            actions: <Widget>[
              MaterialButton(
                  child: Text("OK"),
                  onPressed: () {
                    setState(() {
                      _courses.add(Course(courseName: name.text, tasks: []));
                    });
                  }),
              MaterialButton(
                  child: Text("Cancel"),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              leading: BackButton(
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text("View Courses"),
            ),
            body: Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: _courses.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 50,
                        color: Colors.deepPurple,
                        child: Center(
                            child: Text('${_courses[index].courseName}')),
                      );
                    },
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    createAlertDialog(context);
                  },
                  label: const Text(""),
                  icon: const Icon(Icons.add_circle_rounded),
                )
              ],
            )));
  }
}
