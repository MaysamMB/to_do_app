import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_app/Provider/tasks_provider.dart';
import 'package:to_do_app/screens/details_screen.dart';
import 'package:to_do_app/screens/add_edit_task_screen.dart';
import 'package:to_do_app/widgets/quick_actions_card.dart';
import 'package:to_do_app/widgets/home_header_card.dart';
import '../models/tasks.dart';
import '../widgets/task_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  void _openAddTaskScreen(BuildContext context, WidgetRef ref) async {
    final newTask = await Navigator.push<Task>(
      context,
      MaterialPageRoute(builder: (context) => const AddEditTaskScreen()),
    );
    if (newTask != null) {
      await ref.read(tasksProvider.notifier).addTask(newTask);
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Task added')));
      }
    }
  }

  void _openDetailsScreen(BuildContext context, Task task) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailsScreen(task: task)),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasksAsync = ref.watch(tasksProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const HomeHeaderCard(),
            const QuickActionsCard(),
            cardHeader(context, tasksAsync.value?.length ?? 0),
            Expanded(
              child: tasksAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (err, stack) => Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.wifi_off, size: 40, color: Colors.grey),
                      const SizedBox(height: 12),
                      const Text(
                        'تعذر تحميل المهام. تأكد من الاتصال بالإنترنت',
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: () =>
                            ref.read(tasksProvider.notifier).refresh(),
                        child: const Text('إعادة المحاولة'),
                      ),
                    ],
                  ),
                ),
                data: (tasks) {
                  if (tasks.isEmpty) {
                    return const Center(child: Text('لا توجد مهام بعد'));
                  }
                  return ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      final task = tasks[index];
                      return TaskCard(
                        task: task,
                        onComplete: () => ref
                            .read(tasksProvider.notifier)
                            .toggleCompletion(task.id),
                        onDetails: () => _openDetailsScreen(context, task),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openAddTaskScreen(context, ref),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget cardHeader(BuildContext context, int count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 12, top: 20),
            child: Text(
              'My Tasks ($count)',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ),
      ],
    );
  }
}
