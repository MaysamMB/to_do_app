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

  Task copyWith({
    String? id,
    String? title,
    String? description,
    bool? isCompleted,
    String? name,
    String? priority,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      name: name ?? this.name,
      priority: priority ?? this.priority,
    );
  }
}
