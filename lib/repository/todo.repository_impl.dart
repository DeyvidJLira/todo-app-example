import 'package:todo_app_example/model/todo_item.model.dart';
import 'package:todo_app_example/model/api_response.model.dart';
import 'package:todo_app_example/repository/todo.repository.dart';
import 'package:todo_app_example/service/api.service.dart';
import 'package:todo_app_example/strings.dart';

class TodoRepositoryImpl extends TodoRepository {
  final APIService _apiService;

  TodoRepositoryImpl(this._apiService);

  @override
  Future<APIResponse<TodoItem>> add(TodoItem item) async {
    try {
      final response = await _apiService.addTodoItem(item);
      if (response.statusCode == 201) {
        final dataObject = Map<String, dynamic>.from(response.data);
        final item = TodoItem.fromJson(dataObject);
        return APIResponse.success(item);
      } else {
        return APIResponse.error(Strings.BACKEND_FAILED_OPERATION);
      }
    } on Exception catch (e) {
      return APIResponse.error(e.toString());
    }
  }

  @override
  Future<APIResponse> delete(TodoItem item) async {
    try {
      final response = await _apiService.deleteTodoItem(item);
      if (response.statusCode == 200) {
        return APIResponse.success(null);
      } else {
        return APIResponse.error(Strings.BACKEND_ITEM_NOT_FOUND);
      }
    } on Exception catch (e) {
      return APIResponse.error(e.toString());
    }
  }

  @override
  Future<APIResponse<List<TodoItem>>> getAll() async {
    try {
      final response = await _apiService.getAllTodoItem();
      if (response.statusCode == 200) {
        final dataObject = List<Map<String, dynamic>>.from(response.data);
        List<TodoItem> items = [];
        for (var element in dataObject) {
          items.add(TodoItem.fromJson(element));
        }
        return APIResponse.success(items);
      } else {
        return APIResponse.error(Strings.BACKEND_FAILED_OPERATION);
      }
    } on Exception catch (e) {
      return APIResponse.error(e.toString());
    }
  }

  @override
  Future<APIResponse<TodoItem>> getById(String id) async {
    try {
      final response = await _apiService.getByIdTodoItem(id);
      if (response.statusCode == 200) {
        final dataObject = Map<String, dynamic>.from(response.data);
        final item = TodoItem.fromJson(dataObject);
        return APIResponse.success(item);
      } else {
        return APIResponse.error(Strings.BACKEND_ITEM_NOT_FOUND);
      }
    } on Exception catch (e) {
      return APIResponse.error(e.toString());
    }
  }

  @override
  Future<APIResponse> update(TodoItem item) async {
    try {
      final response = await _apiService.updateTodoItem(item);
      if (response.statusCode == 200) {
        return APIResponse.success(null);
      } else {
        return APIResponse.error(Strings.BACKEND_FAILED_OPERATION);
      }
    } on Exception catch (e) {
      return APIResponse.error(e.toString());
    }
  }
}
