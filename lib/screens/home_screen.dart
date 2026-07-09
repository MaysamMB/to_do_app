import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/add_note.dart';
import 'package:to_do_app/widgets/home_header_card.dart';
// import '../models/tasks.dart';
import '../widgets/task_card.dart';
import '../data/mock_tasks.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBEFEF),
      body: SafeArea(
        child: Column(
          children: [
            const HomeHeaderCard(),
            AddNote(),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 12, top: 20),
              child: Text(
                'My Tasks',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                textAlign: TextAlign.left,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: mockTasks.length,
                itemBuilder: ((context, index) {
                  return TaskCard(task: mockTasks[index]);
                }),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color.fromARGB(255, 253, 195, 195),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
