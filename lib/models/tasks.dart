import 'dart:convert';

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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
      'name': name,
      'priority': priority,
    };
  }

  Map<String, dynamic> toApiMap() {
    return {
      'todo': title,
      'completed': isCompleted,
      'userId': 5, 
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
  return Task(
    id: map['id'].toString(),
    title: map['todo'] ?? map['title'] ?? '',
    description: map['description'] ?? 'No description provided.',
    isCompleted: (map['completed'] ?? map['isCompleted'] ?? false) as bool,
    name: map['name'] as String? ?? '',
    priority: map['priority'] ?? 'Mid',
  );
}

  String toJson() => jsonEncode(toMap());

  factory Task.fromJson(String source) =>
      Task.fromMap(jsonDecode(source) as Map<String, dynamic>);
}
