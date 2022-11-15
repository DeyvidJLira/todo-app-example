class TodoItem {
  String? id;
  String title = "";
  int priority = 0;
  bool isDone = false;

  TodoItem({this.id, this.title = "", this.priority = 0, this.isDone = false});

  TodoItem.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    priority = json['priority'];
    isDone = json['is_done'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['title'] = title;
    data['priority'] = priority;
    data['is_done'] = isDone;
    return data;
  }

  @override
  String toString() {
    return "TodoItem: $title, $priority, $isDone";
  }
}
