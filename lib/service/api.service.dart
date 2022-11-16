import 'package:dio/dio.dart';
import 'package:todo_app_example/model/todo_item.model.dart';
import 'package:todo_app_example/strings.dart';

class APIService {
  final options = BaseOptions(
      baseUrl: "https://crudcrud.com/api/1aa611de7dfc4147aa75176955c9b338");

  Future<Response> getAllTodoItem() async {
    try {
      return await Dio(options).get("/todo");
    } on DioError catch (e) {
      if (e.response != null) {
        return e.response!;
      }
      throw Exception(Strings.BACKEND_GENERIC_ERROR);
    }
  }

  Future<Response> addTodoItem(TodoItem item) async {
    try {
      return await Dio(options).post("/todo", data: item.toJson());
    } on DioError catch (e) {
      if (e.response != null) {
        return e.response!;
      }
      throw Exception(Strings.BACKEND_GENERIC_ERROR);
    }
  }

  Future<Response> getByIdTodoItem(String id) async {
    try {
      return await Dio(options).get("/todo/$id");
    } on DioError catch (e) {
      if (e.response != null) {
        return e.response!;
      }
      throw Exception(Strings.BACKEND_GENERIC_ERROR);
    }
  }

  Future<Response> updateTodoItem(TodoItem item) async {
    try {
      return await Dio(options).put("/todo/${item.id}", data: item.toJson());
    } on DioError catch (e) {
      if (e.response != null) {
        return e.response!;
      }
      throw Exception(Strings.BACKEND_GENERIC_ERROR);
    }
  }

  Future<Response> deleteTodoItem(TodoItem item) async {
    try {
      return await Dio(options).delete("/todo/${item.id}");
    } on DioError catch (e) {
      if (e.response != null) {
        return e.response!;
      }
      throw Exception(Strings.BACKEND_GENERIC_ERROR);
    }
  }
}
