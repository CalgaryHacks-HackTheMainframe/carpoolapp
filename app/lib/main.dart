import 'package:app/addTask.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatelessWidget(),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Todo App'),
      ),
      body: const Center(child: Text('Add a task!')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          runApp(MaterialApp(home: addTask()));
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add_box),
      ),
    );
  }
}
