import 'package:flutter/material.dart';
import 'package:todo_app_example/model/api_response.model.dart';
import 'package:todo_app_example/model/todo_item.model.dart';
import 'package:todo_app_example/repository/todo.repository.dart';
import 'package:todo_app_example/strings.dart';

class TodoFormController extends ChangeNotifier {
  final TodoRepository _repository;

  TodoFormController(this._repository);

  ValueNotifier<TodoItem> todoItem = ValueNotifier(TodoItem());

  final int _priorityMax = 9;
  final int _priorityMin = 0;

  void saveTitle(String? newValue) {
    todoItem.value.title = newValue!;
  }

  String? validateTitle(String? newValue) {
    if (newValue == null) return Strings.VALID_NOT_EMPTY;
    if (newValue.isEmpty) return Strings.VALID_NOT_EMPTY;
    if (newValue.length < 3) return Strings.TODO_LIST_VALID_TITLE_MIN_LENGTH;
    return null;
  }

  void increasePriority() {
    if (todoItem.value.priority == _priorityMax) return;
    todoItem.value.priority++;
    todoItem.notifyListeners();
  }

  void decreasePriority() {
    if (todoItem.value.priority == _priorityMin) return;
    todoItem.value.priority--;
    todoItem.notifyListeners();
  }

  void reset() {
    todoItem.value = TodoItem();
  }

  bool get canIncrease => todoItem.value.priority < _priorityMax;
  bool get canDecrease => todoItem.value.priority > _priorityMin;

  Future<APIResponse<TodoItem>> save() async {
    return await _repository.add(todoItem.value);
  }

  @override
  void dispose() {
    todoItem.dispose();
    super.dispose();
  }
}
