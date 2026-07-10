import 'package:flutter/material.dart';
import 'package:to_do_app/models/tasks.dart';
import 'package:to_do_app/widgets/description_card.dart';
import 'package:to_do_app/widgets/details_card.dart';
import 'package:to_do_app/widgets/details_header.dart';
import 'package:to_do_app/theme/app_theme.dart';

class DetailsScreen extends StatefulWidget {
  final Task task;
  final VoidCallback onComplete;

  const DetailsScreen({
    super.key,
    required this.task,
    required this.onComplete,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: Column(
          children: [
            DetailsHeader(),
            DetailsCard(task: widget.task, onComplete: widget.onComplete),
            DescriptionCard(task: widget.task),
          ],
        ),
      ),
    );
  }
}
