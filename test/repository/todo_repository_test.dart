/*import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app_example/model/api_response.model.dart';
import 'package:todo_app_example/model/todo_item.model.dart';
import 'package:todo_app_example/repository/todo.repository_impl.dart';
import 'package:todo_app_example/service/api.service.dart';


void main() {
  test("add new item", () async {
    final repository = TodoRepositoryImpl(APIService());
    final fakeItem = TodoItem(title: "Largatixa", priority: 3, isDone: false);
    final response = await repository.add(fakeItem);
    expect(response.status, ApiResponseStatus.success);
    expect(response.data?.id, isNotNull);
  });

  test("get all", () async {
    final repository = TodoRepositoryImpl(APIService());
    final response = await repository.getAll();
    expect(response.status, ApiResponseStatus.success);
    expect(response.data!.isNotEmpty, true);
  });

  test("get by id", () async {
    final repository = TodoRepositoryImpl(APIService());
    final response = await repository.getAll();
    expect(response.data!.isNotEmpty, true);
    final itemSearched = response.data!.first;
    final itemFounded = await repository.getById(itemSearched.id!);
    expect(itemSearched.id, itemFounded.data!.id);
  });

  test("update", () async {
    final repository = TodoRepositoryImpl(APIService());
    final response = await repository.getAll();
    expect(response.data!.isNotEmpty, true);
    var itemChanged = response.data!.first;
    itemChanged.title = "Olá mundo";
    final responseUpdate = await repository.update(itemChanged);
    expect(responseUpdate.status, ApiResponseStatus.success);
  });

  test("delete", () async {
    final repository = TodoRepositoryImpl(APIService());
    final response = await repository.getAll();
    expect(response.data!.isNotEmpty, true);
    final itemSearched = response.data!.first;
    final responseDelete = await repository.delete(itemSearched);
    expect(responseDelete.status, ApiResponseStatus.success);
  });
}
*/