import 'package:flutter/material.dart';
import 'package:todo_app_example/repository/todo.repository_impl.dart';
import 'package:todo_app_example/service/api.service.dart';
import 'package:todo_app_example/strings.dart';
import 'package:todo_app_example/ui/components/alert_todo_dialog.component.dart';
import 'package:todo_app_example/ui/components/progress_dialog.component.dart';
import 'package:todo_app_example/ui/todo/controllers/todo_form.controller.dart';

class TodoFormPage extends StatelessWidget {
  TodoFormPage({super.key});

  final TodoFormController _controller =
      TodoFormController(TodoRepositoryImpl(APIService()));
  final _formKey = GlobalKey<FormState>();

  late final ProgressDialog _progressDialog;
  late final AlertTodoDialog _alertTodoDialog;
  late final BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;

    _progressDialog = ProgressDialog(context);
    _alertTodoDialog = AlertTodoDialog(context);

    return Scaffold(
      appBar: AppBar(
          title: const Text(Strings.TODO_FORM_TITLE),
          leading: IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      bottomNavigationBar: SizedBox(
        height: 48,
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: save,
          child: const Text(Strings.LABEL_SAVE),
        ),
      ),
      backgroundColor: Colors.blueGrey[100],
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ValueListenableBuilder(
            valueListenable: _controller.todoItem,
            builder: (context, todoItem, child) => SingleChildScrollView(
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        onSaved: _controller.saveTitle,
                        decoration: const InputDecoration(
                            hintText: Strings.TODO_FORM_HINT_TASK_TITLE,
                            counterText: ""),
                        maxLength: 40,
                        validator: _controller.validateTitle,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          const Text("${Strings.LABEL_PRIORITY}:"),
                          const Expanded(child: SizedBox()),
                          InkWell(
                            onTap: _controller.decreasePriority,
                            child: CircleAvatar(
                              radius: 16,
                              backgroundColor: _controller.canDecrease
                                  ? Colors.red
                                  : Colors.grey,
                              child: const Center(
                                child: Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text("${todoItem.priority}"),
                          const SizedBox(
                            width: 8,
                          ),
                          InkWell(
                            onTap: _controller.increasePriority,
                            child: CircleAvatar(
                              radius: 16,
                              backgroundColor: _controller.canIncrease
                                  ? Colors.green
                                  : Colors.grey,
                              child: const Center(
                                child: Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }

  void save() async {
    if (_formKey.currentState!.validate()) {
      _progressDialog.show();

      _formKey.currentState!.save();
      final response = await _controller.save();

      _progressDialog.hide();

      if (response.isSuccess) {
        _alertTodoDialog.show(
            title: Strings.TODO_FORM_ALERT_SUCCESS_TITLE,
            message: Strings.TODO_FORM_ALERT_SUCCESS_MESSAGE,
            positiveAction: () {
              _formKey.currentState!.reset();
            },
            negativeAction: () {
              Navigator.pop(_context);
            });
      } else {
        _alertTodoDialog.showInfo(
            title: Strings.TODO_FORM_ALERT_ERROR_TITLE,
            message: response.message ?? Strings.BACKEND_GENERIC_ERROR);
      }
    }
  }
}
