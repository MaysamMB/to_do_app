import 'package:flutter/material.dart';
import 'package:to_do_app/theme/app_theme.dart';

class AddNote extends StatelessWidget {
  AddNote({super.key});
  final today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(12),
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              Text(
                'My Evernote',
                textAlign: TextAlign.left,
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
            miniCard("New Note", AppTheme.primary),
            miniCard("New Reminder", AppTheme.secondary),
          ],
        ),
      ],
    );
  }

  Widget miniCard(String text, Color colors) {
    return Container(
      alignment: Alignment.centerLeft,
      width: 180,
      height: 170,
      padding: const EdgeInsets.only(left: 18),
      decoration: BoxDecoration(
        color: colors,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.only(bottom: 10, top: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Container(
            width: 50,
            height: 50,
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: AppTheme.surface.withValues(alpha: 0.9),
              borderRadius: BorderRadius.circular(50),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.add, color: AppTheme.primary),
            ),
          ),
          Text(
            'Create',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 23,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
