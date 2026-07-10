import 'package:flutter/material.dart';
import 'package:to_do_app/models/tasks.dart';

// import 'package:to_do_app/theme/app_theme.dart';

class TaskInfo extends StatelessWidget {
  final Task task;

  const TaskInfo({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: [
          // Priority
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: getPriorityColor().withValues(alpha: 0.12),
              border: Border.all(
                color: getPriorityColor().withValues(alpha: 0.35),
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.flag_outlined, size: 18, color: getPriorityColor()),
                const SizedBox(width: 6),
                Text(
                  task.priority,
                  style: TextStyle(
                    color: getPriorityColor(),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          // Status
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: task.isCompleted
                  ? Colors.green.shade50
                  : Colors.grey.shade100,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: task.isCompleted ? Colors.green : Colors.grey.shade400,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  task.isCompleted
                      ? Icons.check_circle_outline
                      : Icons.radio_button_unchecked,
                  size: 18,
                  color: task.isCompleted ? Colors.green : Colors.grey,
                ),
                const SizedBox(width: 6),
                Text(
                  task.isCompleted ? "Complteted" : "InCompleted",
                  style: TextStyle(
                    color: task.isCompleted ? Colors.green : Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color getPriorityColor() {
    switch (task.priority.toLowerCase()) {
      case "high":
        return Colors.red;
      case "mid":
        return Colors.orange;
      case "low":
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}
