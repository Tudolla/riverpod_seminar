import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

part 'async_notifier_provider.g.dart';

class Todo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Todo(
      {required this.userId,
      required this.id,
      required this.title,
      required this.completed});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }
}

@riverpod
class AsyncTodos extends _$AsyncTodos {
  Future<List<Todo>> _fetchTodos() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/todos?_limit=10'));
    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => Todo.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load todos');
    }
  }

  @override
  Future<List<Todo>> build() async {
    return _fetchTodos();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchTodos());
  }

  Future<void> toggleTodoCompletion(String id) async {
    state = await AsyncValue.guard(() async {
      final updatedTodos = [
        for (final todo in await future)
          if (todo.id == id)
            Todo(
                userId: todo.userId,
                id: todo.id,
                title: todo.title,
                completed: !todo.completed)
          else
            todo
      ];
      return updatedTodos;
    });
  }
}
