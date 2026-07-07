import 'package:flutter/material.dart';
import 'package:to_do_app/data/mock_tasks.dart';

import '../models/tasks.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        enabled: task.isCompleted ? true : false,

        tileColor: task.isCompleted
            ? const Color(0xFFF9E8A2)
            : const Color.fromARGB(186, 229, 228, 223),
        trailing: Text(task.id.toString(), style: TextStyle()),
        title: Text(
          task.title,
          style: TextStyle(
            color: const Color(0xFF95BDD7),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
