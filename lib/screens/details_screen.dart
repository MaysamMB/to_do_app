import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_app/Provider/tasks_provider.dart';
import 'package:to_do_app/models/tasks.dart';
import 'package:to_do_app/screens/add_edit_task_screen.dart';
import 'package:to_do_app/widgets/description_card.dart';
import 'package:to_do_app/widgets/details_card.dart';
import 'package:to_do_app/widgets/details_header.dart';
import 'package:to_do_app/theme/app_theme.dart';
import 'package:to_do_app/widgets/task_info.dart';

class DetailsScreen extends ConsumerWidget {
  final Task task;

  const DetailsScreen({super.key, required this.task});

  Future<void> _editTask(BuildContext context, WidgetRef ref) async {
    final updatedTask = await Navigator.push<Task>(
      context,
      MaterialPageRoute(builder: (context) => AddEditTaskScreen(task: task)),
    );
    if (updatedTask != null) {
      await ref.read(tasksProvider.notifier).updateTask(updatedTask);
      if (context.mounted) Navigator.pop(context);
    }
  }

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Task'),
        content: const Text('Are you sure you want to delete this task?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await ref.read(tasksProvider.notifier).deleteTask(task.id);
      if (context.mounted) Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: Column(
          children: [
            DetailsHeader(
              onEdit: () => _editTask(context, ref),
              onDelete: () => _confirmDelete(context, ref),
            ),
            DetailsCard(
              task: task,
              onComplete: () => ref.read(tasksProvider.notifier).toggleCompletion(task.id),
            ),
            TaskInfo(task: task),
            DescriptionCard(task: task),
          ],
        ),
      ),
    );
  }
}