import 'package:flutter/material.dart';
import '../data/mock_tasks.dart';

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
            color: const Color(0xFFFFE2E2),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Text(
            mockTasks[0].name[0],
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hi, ${mockTasks[0].name} 👋",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
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
        border: Border.all(color: Colors.white),
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: IconButton(onPressed: () {}, icon: Icon(icon)),
    );
  }
}
