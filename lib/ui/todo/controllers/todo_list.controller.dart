import 'package:flutter/material.dart';
import 'package:todo_app_example/model/api_response.model.dart';
import 'package:todo_app_example/model/todo_item.model.dart';
import 'package:todo_app_example/repository/todo.repository.dart';

class TodoListController extends ChangeNotifier {
  final TodoRepository _repository;

  TodoListController(this._repository);

  ValueNotifier<APIResponse<List<TodoItem>>> responseListTodo =
      ValueNotifier(APIResponse.loading());

  void load() async {
    responseListTodo.value = await _repository.getAll();
    notifyListeners();
  }

  void sync() async {
    responseListTodo.value = APIResponse.loading();
    notifyListeners();
    responseListTodo.value = await _repository.getAll();
    notifyListeners();
  }

  void update(TodoItem item) async {
    await _repository.update(item);
  }

  void remove(int index) async {
    await _repository.delete(responseListTodo.value.data![index]);
  }

  void orderBy(SortType sortType) {
    switch (sortType) {
      case SortType.az:
        responseListTodo.value.data!.sort((a, b) => a.title.compareTo(b.title));
        break;
      case SortType.za:
        responseListTodo.value.data!.sort((a, b) => b.title.compareTo(a.title));
        break;
      case SortType.highPriority:
        responseListTodo.value.data!
            .sort((a, b) => b.priority.compareTo(a.priority));
        break;
      case SortType.lowPriority:
        responseListTodo.value.data!
            .sort((a, b) => a.priority.compareTo(b.priority));
        break;
    }
    responseListTodo.value = APIResponse.success(responseListTodo.value.data);
    notifyListeners();
  }

  @override
  void dispose() {
    responseListTodo.dispose();
    super.dispose();
  }
}

enum SortType { az, za, highPriority, lowPriority }
