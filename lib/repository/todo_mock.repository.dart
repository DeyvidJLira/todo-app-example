import 'package:todo_app_example/model/todo_item.model.dart';
import 'package:todo_app_example/model/api_response.model.dart';
import 'package:todo_app_example/repository/todo.repository.dart';
import 'package:uuid/uuid.dart';

class TodoMockRepository extends TodoRepository {
  @override
  Future<APIResponse<TodoItem>> add(TodoItem item) async {
    await Future.delayed(const Duration(milliseconds: 700));
    return APIResponse.success(
        TodoItem(id: const Uuid().v4(), title: "Bolo", priority: 2));
  }

  @override
  Future<APIResponse> delete(TodoItem item) async {
    await Future.delayed(const Duration(milliseconds: 700));
    return APIResponse.success(null);
  }

  @override
  Future<APIResponse<List<TodoItem>>> getAll() async {
    await Future.delayed(const Duration(milliseconds: 700));
    List<TodoItem> listTodo = [
      TodoItem(
          id: const Uuid().v4(),
          title: "Comprar bolo e ver se dá para ir",
          priority: 4),
      TodoItem(id: const Uuid().v4(), title: "Comprar bolo 2", priority: 4),
      TodoItem(id: const Uuid().v4(), title: "Comprar bolo 3", priority: 4)
    ];
    return APIResponse<List<TodoItem>>.success(listTodo);
  }

  @override
  Future<APIResponse<TodoItem>> getById(String id) async {
    await Future.delayed(const Duration(milliseconds: 700));
    return APIResponse<TodoItem>.success(
        TodoItem(id: const Uuid().v4(), title: "Comprar bolo ", priority: 4));
  }

  @override
  Future<APIResponse> update(TodoItem item) async {
    await Future.delayed(const Duration(milliseconds: 700));
    return APIResponse.success(null);
  }
}
