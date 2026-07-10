import 'package:flutter/material.dart';
import 'package:to_do_app/models/tasks.dart';
import 'package:to_do_app/screens/details_header.dart';
import 'package:to_do_app/theme/app_theme.dart';

class DetailsScreen extends StatelessWidget {
  final Task task;

  const DetailsScreen({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(child: Column(children: [DetailsHeader()])),
    );
  }
}
