import 'package:flutter/material.dart';
import 'package:todo_app_example/strings.dart';
import 'package:todo_app_example/ui/todo/pages/todo_form.page.dart';
import 'package:todo_app_example/ui/todo/pages/todo_list.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.APP_NAME,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/": (_) => const TodoListPage(),
        "/list": (_) => const TodoListPage(),
        "/new": (_) => const TodoFormPage()
      },
    );
  }
}
