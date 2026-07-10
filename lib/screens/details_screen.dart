import 'package:flutter/material.dart';
import 'package:to_do_app/models/tasks.dart';
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
            Column(
              children: [
                Card(
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),

                    tileColor: AppTheme.surface,
                    title: Text(
                      widget.task.title,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    leading: GestureDetector(
                      onTap: () {
                        widget.onComplete();
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: widget.task.isCompleted
                              ? null
                              : Border.all(color: AppTheme.primary, width: 1),
                          color: widget.task.isCompleted
                              ? AppTheme.secondary
                              : Colors.transparent,
                        ),
                        child: widget.task.isCompleted
                            ? const Icon(
                                Icons.check,
                                size: 18,
                                color: Colors.white,
                              )
                            : null,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
