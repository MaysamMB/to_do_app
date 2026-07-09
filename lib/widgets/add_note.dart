import 'package:flutter/material.dart';

class AddNote extends StatelessWidget {
  AddNote({super.key});
  final today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            child: Text('My Evernote\nToday ${today.day}/${today.month}/${today.year}'),
          ),
        ],
      ),
    );
  }
}
