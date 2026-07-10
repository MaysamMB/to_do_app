import 'package:flutter/material.dart';
import 'package:to_do_app/screens/details_screen.dart';
import 'package:to_do_app/widgets/quick_actions_card.dart';
import 'package:to_do_app/widgets/home_header_card.dart';
import '../models/tasks.dart';
import '../widgets/task_card.dart';
import '../data/mock_tasks.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void toggleTaskCompletion(int index) {
    setState(() {
      tasks[index] = tasks[index].copyWith(
        isCompleted: !tasks[index].isCompleted,
      );
    });
  }

  List<Task> tasks = [...mockTasks];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const HomeHeaderCard(),
            QuickActionsCard(),
            cardHeader(),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: ((context, index) {
                  return TaskCard(
                    task: tasks[index],
                    onComplete: () {
                      toggleTaskCompletion(index);
                    },
                    onDetails: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return DetailsScreen(
                              task: tasks[index],
                              onComplete: () {
                                toggleTaskCompletion(index);
                              },
                            );
                          },
                        ),
                      );
                    },
                  );
                }),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        // backgroundColor: Color(0xFFC5B3D3).withValues(alpha: 0.8),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget cardHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 12, top: 20),
            child: Text(
              'My Tasks (${tasks.length.toString()})',
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
