import 'package:flutter/material.dart';
import 'package:todo_app_example/model/todo_item.model.dart';

class TodoItemCard extends StatefulWidget {
  final TodoItem item;

  const TodoItemCard({super.key, required this.item});

  @override
  State<TodoItemCard> createState() => _TodoItemCardState();
}

class _TodoItemCardState extends State<TodoItemCard> {
  late ValueNotifier<bool> isDoneValue;

  @override
  void initState() {
    super.initState();
    isDoneValue = ValueNotifier(widget.item.isDone);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      child: ValueListenableBuilder(
        valueListenable: isDoneValue,
        builder: (_, isChecked, child) => Container(
            height: 80,
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                SizedBox(
                  child: Center(
                    child: Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        isDoneValue.value = !isChecked;
                        widget.item.isDone = isDoneValue.value;
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.item.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 20,
                            decoration:
                                isChecked ? TextDecoration.lineThrough : null),
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    isDoneValue.dispose();
  }
}
