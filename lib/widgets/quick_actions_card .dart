import 'package:flutter/material.dart';
import 'package:to_do_app/theme/app_theme.dart';
import 'package:to_do_app/widgets/mini_card.dart';

class AddNote extends StatelessWidget {
  const AddNote({super.key});

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(12),
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              Text(
                'My Evernote',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Today ${today.day}/${today.month}/${today.year}',
                textAlign: TextAlign.left,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontSize: 18),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MiniCard(text: "New Note", color: AppTheme.primary),
            MiniCard(text: "New Reminder", color: AppTheme.secondary),
          ],
        ),
      ],
    );
  }
}
