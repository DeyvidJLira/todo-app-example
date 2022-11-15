import 'package:todo_app_example/model/api_response.model.dart';
import 'package:todo_app_example/model/todo_item.model.dart';

abstract class TodoRepository {
  Future<APIResponse<List<TodoItem>>> getAll();
  Future<APIResponse<TodoItem>> add(TodoItem item);
  Future<APIResponse<TodoItem>> getById(String id);
  Future<APIResponse> update(TodoItem item);
  Future<APIResponse> delete(TodoItem item);
}
