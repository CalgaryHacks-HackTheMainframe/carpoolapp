import 'package:app/addTask.dart';
import 'package:app/courses.dart';
import 'package:app/dataSource.dart';
import 'package:app/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Task.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => provider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Home(),
        ),
      );
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<provider>(context).tasks;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student To Do App'),
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: (content) => [
              PopupMenuItem(value: 1, child: Text("Courses")),
              PopupMenuItem(value: 2, child: Text("View Tasks")),
            ],
            onSelected: (int menu) {
              if (menu == 1) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => courses()));
              } else if (menu == 2) {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => courses()));
              }
            },
          )
        ],
      ),
      body: Container(
        child: SfCalendar(
          dataSource: DataSource(tasks),
          view: CalendarView.week,
          showNavigationArrow: true,
          initialSelectedDate: DateTime.now(),
          onLongPress: (details) {
            final _provider = Provider.of<provider>(context, listen: false);
            _provider.setDate(details.date!);
          },
        ),
      ),
      //const Center(child: Text('Add a task!')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => addTask()));
          // MaterialPageRoute(builder: (context) => add_task()),
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add_box),
      ),
    );
  }
}
