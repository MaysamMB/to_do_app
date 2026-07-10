import 'package:flutter/material.dart';
import 'package:to_do_app/models/tasks.dart';
import '../theme/app_theme.dart';

class DescriptionCard extends StatelessWidget {
  final Task task;

  const DescriptionCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        task.description,
        textAlign: TextAlign.right,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: AppTheme.textMuted,
          fontSize: 18,
          height: 1.8,
        ),
      ),
    );
  }
}
