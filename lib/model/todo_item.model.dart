import 'dart:math';

import 'package:uuid/uuid.dart';

class TodoItem {
  String? id;
  String title = "";
  int priority = 0;
  bool isDone = false;

  TodoItem({this.id, this.title = "", this.priority = 0, this.isDone = false});

  TodoItem.mock() {
    id = const Uuid().v4();
    title = String.fromCharCodes(
        List.generate(10, (index) => Random().nextInt(33) + 89));
    priority = Random().nextInt(10);
    isDone = Random().nextBool();
  }

  @override
  String toString() {
    return "TodoItem: $title, $priority, $isDone";
  }
}
