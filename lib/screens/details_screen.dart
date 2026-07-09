import 'package:flutter/material.dart';
import 'package:to_do_app/models/tasks.dart';

class DetailsScreen extends StatelessWidget {
  final Task task;

  const DetailsScreen({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(task.title)),
      body: Column(children: [Text(task.description)]),
    );
  }
}
