import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_app/models/tasks.dart';
import 'package:to_do_app/services/task_api_service.dart';
import 'package:to_do_app/services/task_storage_service.dart';

final taskApiServiceProvider = Provider((ref) => TaskApiService());
final taskStorageServiceProvider = Provider((ref) => TaskStorageService());

class TasksNotifier extends AsyncNotifier<List<Task>> {
  TaskApiService get _api => ref.read(taskApiServiceProvider);
  TaskStorageService get _storage => ref.read(taskStorageServiceProvider);

@override
Future<List<Task>> build() async {
  final cached = await _storage.loadTasks();

  if (cached != null && cached.isNotEmpty) {
    return cached;
  }

  final freshTasks = await _api.fetchTasks();
  await _storage.saveTasks(freshTasks);
  return freshTasks;
}

  Future<void> addTask(Task task) async {
    final created = await _api.createTask(task);
    final updated = [...state.value ?? <Task>[], created];
    state = AsyncData(updated);
    await _storage.saveTasks(updated);
  }

  Future<void> updateTask(Task task) async {
    final updatedTask = await _api.updateTask(task);
    final updated = [
      for (final t in state.value ?? <Task>[])
        if (t.id == updatedTask.id) updatedTask else t,
    ];
    state = AsyncData(updated);
    await _storage.saveTasks(updated);
  }

  Future<void> deleteTask(String id) async {
    await _api.deleteTask(id);
    final updated = (state.value ?? <Task>[]).where((t) => t.id != id).toList();
    state = AsyncData(updated);
    await _storage.saveTasks(updated);
  }

  Future<void> toggleCompletion(String id) async {
    final task = (state.value ?? <Task>[]).firstWhere((t) => t.id == id);
    await updateTask(task.copyWith(isCompleted: !task.isCompleted));
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final freshTasks = await _api.fetchTasks();
      await _storage.saveTasks(freshTasks);
      return freshTasks;
    });
  }
}

final tasksProvider = AsyncNotifierProvider<TasksNotifier, List<Task>>(
  TasksNotifier.new,
);
