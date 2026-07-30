import 'package:dio/dio.dart';
import 'package:to_do_app/models/tasks.dart';

class TaskApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://dummyjson.com'));

  Future<List<Task>> fetchTasks() async {
    final response = await _dio.get('/todos', queryParameters: {'limit': 0});
    final list = response.data['todos'] as List;
    return list.map((json) => Task.fromMap(json)).toList();
  }

  Future<Task> createTask(Task task) async {
    final response = await _dio.post('/todos/add', data: task.toApiMap());
    return Task.fromMap(response.data);
  }

  Future<Task> updateTask(Task task) async {
    final response = await _dio.put('/todos/${task.id}', data: task.toApiMap());
    return Task.fromMap(response.data).copyWith(
      title: task.title,
      description: task.description,
      priority: task.priority,
    );
  }

  Future<void> deleteTask(String id) async {
    await _dio.delete('/todos/$id');
  }
}
