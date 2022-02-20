import 'package:app/Course.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Task.dart';
import 'provider.dart';

class courses extends StatefulWidget {
  @override
  mycourses createState() => mycourses();
}

class mycourses extends State<courses> {
  createAlertDialog(BuildContext context) {
    final _provider = Provider.of<provider>(context, listen: false);
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
                  decoration: InputDecoration(hintText: 'Name of Course'),
                )
              ],
            ),
            actions: <Widget>[
              MaterialButton(
                  child: Text("OK"),
                  onPressed: () {
                    setState(() {
                      xadd(name.text, _provider);
                      Navigator.pop(context);
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
    final _provider = Provider.of<provider>(context, listen: false);
    refresh(_provider);
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
                    itemCount: _provider.xcourses.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                          onTap: () {
                            AlertDialog alert = AlertDialog(
                              title: Text(
                                  "${_provider.xcourses[index].courseName}"),
                              content: Column(children: <Widget>[
                                Text('Tasks for this course:\n'),
                                Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Container(
                                          height: 300.0,
                                          width: 300.0,
                                          child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: _provider
                                                  .xcourses[index].tasks.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int j) {
                                                return ListTile(
                                                  title: Text(
                                                      "${_provider.xcourses[index].tasks[j].name}"),
                                                );
                                              })),
                                    ])
                              ]),
                            );
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return alert;
                                });
                          },
                          child: Container(
                              height: 50.00,
                              padding: EdgeInsets.all(5.0),
                              child: Material(
                                borderRadius: BorderRadius.circular(6.0),
                                color: Colors.blueAccent,
                                child: Center(
                                    child: Text(
                                        '${_provider.xcourses[index].courseName}')),
                              )));
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

  void xadd(String name, final xprovider) {
    List<Task> found = [];
    List<Task> allTasks = xprovider.tasks;
    allTasks.forEach((t) {
      if (name == t.course_name) {
        found.add(t);
      }
    });
    xprovider.xcourses.add(Course(courseName: name, tasks: found));
  }

  void refresh(final xprovider) {
    List<Course> allC = xprovider.xcourses;
    List<Task> allT = xprovider.tasks;
    allT.forEach((t) {
      allC.forEach((c) {
        if (c.courseName == t.course_name && !c.tasks.contains(t)) {
          xprovider.addTtoC(c, t);
          print("changed");
        }
      });
    });
  }
}
