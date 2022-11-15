import 'package:flutter/material.dart';
import 'package:todo_app_example/repository/todo.repository_impl.dart';
import 'package:todo_app_example/service/api.service.dart';
import 'package:todo_app_example/strings.dart';
import 'package:todo_app_example/ui/components/animate_list_item.component.dart';
import 'package:todo_app_example/ui/todo/controllers/todo_list.controller.dart';
import 'package:todo_app_example/ui/todo/widgets/placeholder_empty.dart';
import 'package:todo_app_example/ui/todo/widgets/progress_container.dart';
import 'package:todo_app_example/ui/todo/widgets/todo_item_card.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TodoListController _controller =
      TodoListController(TodoRepositoryImpl(APIService()));

  @override
  void initState() {
    super.initState();
    _controller.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(Strings.TODO_LIST_TITLE),
          actions: [
            IconButton(
                onPressed: _controller.sync, icon: const Icon(Icons.sync)),
            PopupMenuButton(
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(Icons.sort_by_alpha),
                ),
                itemBuilder: (_) => [
                      PopupMenuItem(
                          onTap: () => _controller.orderBy(SortType.az),
                          child: const Text(Strings.LABEL_SORT_AZ)),
                      PopupMenuItem(
                          onTap: () => _controller.orderBy(SortType.za),
                          child: const Text(Strings.LABEL_SORT_ZA)),
                      PopupMenuItem(
                          onTap: () =>
                              _controller.orderBy(SortType.highPriority),
                          child: const Text(Strings.LABEL_SORT_HIGH_PRIORITY)),
                      PopupMenuItem(
                          onTap: () =>
                              _controller.orderBy(SortType.lowPriority),
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
            child: ValueListenableBuilder(
                valueListenable: _controller.responseListTodo,
                builder: (context, responseList, child) => responseList
                        .isLoading
                    ? const ProgressContainer()
                    : responseList.isError
                        ? const PlaceholderEmpty()
                        : responseList.isSuccess && responseList.data!.isEmpty
                            ? const PlaceholderEmpty()
                            : ListView.builder(
                                itemCount: responseList.data?.length,
                                itemBuilder: (_, index) => AnimateListItem(
                                    index,
                                    Dismissible(
                                      background: Container(
                                        alignment: Alignment.centerRight,
                                        padding:
                                            const EdgeInsets.only(right: 16),
                                        color: Colors.red,
                                        child: const Icon(
                                          Icons.delete,
                                          color: Colors.white,
                                        ),
                                      ),
                                      onDismissed: (direction) {
                                        _controller.remove(index);
                                      },
                                      direction: DismissDirection.endToStart,
                                      key: ValueKey(responseList.data![index]),
                                      child: TodoItemCard(
                                        item: responseList.data![index],
                                        update: _controller.update,
                                      ),
                                    ),
                                    key: ValueKey<int>(index)),
                              )),
          ),
        ));
  }
}
