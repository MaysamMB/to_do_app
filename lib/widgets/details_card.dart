import 'package:flutter/material.dart';
import 'package:to_do_app/models/tasks.dart';
import 'package:to_do_app/theme/app_theme.dart';

class DetailsCard extends StatelessWidget {
  final Task task;
  final VoidCallback onComplete;

  const DetailsCard({
    super.key,
    required this.task,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),

        tileColor: AppTheme.surface,

        title: Text(
          task.title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),

        leading: GestureDetector(
          onTap: () {
            onComplete();
            Navigator.pop(context);
          },

          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),

              border: task.isCompleted
                  ? null
                  : Border.all(
                      color: AppTheme.primary,
                      width: 1,
                    ),

              color: task.isCompleted
                  ? AppTheme.secondary
                  : Colors.transparent,
            ),

            child: task.isCompleted
                ? const Icon(
                    Icons.check,
                    size: 18,
                    color: Colors.white,
                  )
                : null,
          ),
        ),
      ),
    );
  }
}