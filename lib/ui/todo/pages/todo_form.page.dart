import 'package:flutter/material.dart';
import 'package:todo_app_example/strings.dart';

class TodoFormPage extends StatelessWidget {
  TodoFormPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
          onPressed: () {},
          child: const Text(Strings.LABEL_SAVE),
        ),
      ),
      backgroundColor: Colors.blueGrey[100],
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: Strings.TODO_FORM_HINT_TASK_TITLE,
                          counterText: ""),
                      maxLength: 40,
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
                          onTap: () {},
                          child: const CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.red,
                            child: Center(
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
                        const Text("0"),
                        const SizedBox(
                          width: 8,
                        ),
                        InkWell(
                          onTap: () {},
                          child: const CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.green,
                            child: Center(
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
    );
  }
}
