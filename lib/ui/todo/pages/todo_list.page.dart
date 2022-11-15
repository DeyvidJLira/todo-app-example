import 'package:flutter/material.dart';
import 'package:todo_app_example/model/todo_item.model.dart';
import 'package:todo_app_example/strings.dart';
import 'package:todo_app_example/ui/components/animate_list_item.component.dart';
import 'package:todo_app_example/ui/todo/widgets/todo_item_card.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(Strings.TODO_LIST_TITLE),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.sync)),
            PopupMenuButton(
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(Icons.sort_by_alpha),
                ),
                itemBuilder: (_) => [
                      PopupMenuItem(
                          onTap: () {},
                          child: const Text(Strings.LABEL_SORT_AZ)),
                      PopupMenuItem(
                          onTap: () {},
                          child: const Text(Strings.LABEL_SORT_ZA)),
                      PopupMenuItem(
                          onTap: () {},
                          child: const Text(Strings.LABEL_SORT_HIGH_PRIORITY)),
                      PopupMenuItem(
                          onTap: () {},
                          child: const Text(Strings.LABEL_SORT_LOW_PRIORITY))
                    ])
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, "/new");
          },
          child: const Icon(Icons.add),
        ),
        backgroundColor: Colors.blueGrey[100],
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
                children: List<Widget>.generate(
                    10,
                    (index) => AnimateListItem(
                        index,
                        Dismissible(
                          background: Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 16),
                            color: Colors.red,
                            child: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                          direction: DismissDirection.endToStart,
                          key: ValueKey(index),
                          child: TodoItemCard(item: TodoItem.mock()),
                        ),
                        key: ValueKey<int>(index)))),
          ),
        ));
  }
}
