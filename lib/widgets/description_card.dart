import 'package:flutter/material.dart';
import 'package:to_do_app/models/tasks.dart';
import '../theme/app_theme.dart';

class DescriptionCard extends StatelessWidget {
  final Task task;

  const DescriptionCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Container(
          margin: EdgeInsets.all(20),
          child: Text(
            "Description",
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.start,
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            task.description,
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppTheme.textMuted,
              fontSize: 18,
              height: 1.8,
            ),
          ),
        ),
      ],
    );
  }
}
