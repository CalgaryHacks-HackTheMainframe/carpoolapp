import 'package:app/addTask.dart';
import 'package:app/dataSource.dart';
import 'package:app/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
          PopupMenuButton<String>(
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {'Day View', 'Courses'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
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

  void handleClick(String value) {
    switch (value) {
      case 'Day View':
        // Navigator.of(context)??? need context
        //     .push(MaterialPageRoute(builder: (context) => _NameofdayView()));
        break;
      case 'Courses':
        break;
    }
  }
}