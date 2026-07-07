  import 'package:flutter/material.dart';
  import '../models/tasks.dart';
  import '../widgets/task_card.dart';
  import '../data/mock_tasks.dart';

  class HomeScreen extends StatelessWidget {
    const HomeScreen({super.key});
    // https://colorhunt.co/palette/f9e8a2b4e1eb95bdd778a4cb => color link
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('My Tasks'),
          backgroundColor: const Color(0xFF95BDD7),
        ),
        body: ListView.builder(
          itemCount: mockTasks.length,
          itemBuilder: ((context, index) {
            return TaskCard(task: mockTasks[index]);
          }),),
      );
    }
  }
