import 'package:flutter/material.dart';
import '../data/mock_tasks.dart';
import 'package:to_do_app/theme/app_theme.dart';

class HomeHeaderCard extends StatelessWidget {
  const HomeHeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return (Row(
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          alignment: Alignment.center,
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppTheme.secondary.withValues(alpha: 0.2),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Text(
            mockTasks[0].name[0],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: AppTheme.primary,
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hi, ${mockTasks[0].name} 👋",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        ),
        const Spacer(),
        Row(
          children: [
            headerButton(Icons.search),
            headerButton(Icons.notifications_outlined),
          ],
        ),
      ],
    ));
  }

  Widget headerButton(IconData icon) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.primary.withValues(alpha: 0.08)),
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(50),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(icon, color: AppTheme.primary),
      ),
    );
  }
}
