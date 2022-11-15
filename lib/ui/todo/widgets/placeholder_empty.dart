import 'package:flutter/material.dart';
import 'package:todo_app_example/strings.dart';

class PlaceholderEmpty extends StatelessWidget {
  const PlaceholderEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Center(
        child: Text(Strings.TODO_LIST_EMPTY),
      ),
    );
  }
}
