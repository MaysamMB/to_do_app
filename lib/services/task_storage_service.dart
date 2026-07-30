import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/models/tasks.dart';

class TaskStorageService {
  static const String _key = 'tasks';

  Future<List<Task>?> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final taskStrings = prefs.getStringList(_key);

    if (taskStrings == null) return null;

    return taskStrings.map((jsonString) => Task.fromJson(jsonString)).toList();
  }

  Future<void> saveTasks(List<Task> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    final taskStrings = tasks.map((task) => task.toJson()).toList();
    await prefs.setStringList(_key, taskStrings);
  }
}