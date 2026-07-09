class Task {
  final String id;
  final String title;
  final String description;
  final bool isCompleted;
  final String name;
  final String priority;

  const Task({
    required this.name,
    required this.id,
    required this.title,
    required this.description,
    this.isCompleted = false,
    required this.priority,
  });
}
