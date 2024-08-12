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
  int limit = 20;
  int currentSkip = 0;
  List<Todo> todos = [];

  Future<List<Todo>> _fetchTodos() async {
    // int currentPage = 0;
    // &skip=${currentPage}

    final response = await http.get(
      Uri.parse(
        'https://jsonplaceholder.typicode.com/todos?_limit=$limit&_start=$currentSkip',
      ),
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      List<Todo> newList = jsonList.map((json) => Todo.fromJson(json)).toList();
      todos.addAll(newList);
      return todos;
    } else {
      throw Exception('Failed to load todos');
    }
  }

  @override
  Future<List<Todo>> build() async {
    return _fetchTodos();
  }

  // Future<void> refresh() async {
  //   currentSkip += limit;
  //   state = const AsyncValue.loading();
  //   state = await AsyncValue.guard(() => _fetchTodos());
  // }

  Future<void> loadMore() async {
    currentSkip += limit;
    state = await AsyncValue.guard(() => _fetchTodos());
  }

  void refresh() {
    currentSkip = 0;
    todos.clear();
    state = const AsyncValue.loading();
    _fetchTodos().then((todos) {
      state = AsyncValue.data(todos);
    }).catchError((error) {
      state = AsyncValue.error(error, StackTrace.current);
    });
  }

  Future<void> toggleTodoCompletion(int id) async {
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
            todo,
      ];
      return updatedTodos;
    });
  }

  // Phương thức để xóa một todo
  Future<void> removeTodo(int id) async {
    //  AsyncValue is present for : trạng thái dữ liệu bất đồng bộ (data, loading, error)
    state = const AsyncValue.loading();

    try {
      // Lấy danh sách hiện tại
      // future: lớp tự động được tạo ra: là giá trị hiện tại của state
      final currentTodos = await future;

      // Xóa todo khỏi danh sách
      final updatedTodos = currentTodos.where((todo) => todo.id != id).toList();

      // Giả lập việc cập nhật lên API
      await Future.delayed(const Duration(milliseconds: 300));

      // Cập nhật state với danh sách mới
      state = AsyncValue.data(updatedTodos);
    } catch (e, stack) {
      // Xử lý lỗi
      state = AsyncValue.error(e, stack);
    }
  }
}
