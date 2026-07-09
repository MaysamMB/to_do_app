import 'package:flutter/material.dart';
import 'package:to_do_app/theme/app_theme.dart';
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
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        enabled: !task.isCompleted,

        tileColor: task.isCompleted
            ? AppTheme.secondary.withValues(alpha: 0.15)
            : AppTheme.surface,
        leading: GestureDetector(
          onTap: onComplete,
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: task.isCompleted
                  ? null
                  : Border.all(color: AppTheme.primary, width: 1),
              color: task.isCompleted ? AppTheme.secondary : Colors.transparent,
            ),
            child: task.isCompleted
                ? const Icon(Icons.check, size: 18, color: Colors.white)
                : null,
          ),
        ),
        trailing: IconButton(
          onPressed: onDetails,
          icon: Icon(
            Icons.arrow_forward_ios,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        title: Text(task.title, style: Theme.of(context).textTheme.titleLarge),
        subtitle: Text(
          "Priority: ${task.priority}",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
