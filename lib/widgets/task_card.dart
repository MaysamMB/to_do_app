import 'package:flutter/material.dart';
// import 'package:to_do_app/data/mock_tasks.dart';

import '../models/tasks.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final VoidCallback onComplete;
  final VoidCallback onDetails;

  const TaskCard({
    super.key,
    required this.task,
    required this.onComplete,
    required this.onDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        enabled: !task.isCompleted,

        tileColor: task.isCompleted
            ? const Color(0xFFFFE2E2)
            : const Color(0xFFFFFFFF),
        // leading: Text(task.id.toString(), style: TextStyle()),
        leading: GestureDetector(
          onTap: onComplete,
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: const Color(0xFFC5B3D3), width: 2),
              color: task.isCompleted
                  ? const Color(0xFFC5B3D3)
                  : Colors.transparent,
            ),
            child: task.isCompleted
                ? const Icon(Icons.check, size: 18, color: Colors.white)
                : null,
          ),
        ),
        trailing: IconButton(
          onPressed: onDetails,
          icon: const Icon(Icons.arrow_forward_ios),
        ),
        title: Text(
          task.title,
          style: TextStyle(
            color: const Color(0xFFC5B3D3),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          "Priority: ${task.priority}",
          style: TextStyle(
            color: Color.fromARGB(255, 187, 175, 196),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
