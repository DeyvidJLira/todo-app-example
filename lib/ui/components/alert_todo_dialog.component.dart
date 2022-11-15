import 'package:flutter/material.dart';
import 'package:todo_app_example/strings.dart';

class AlertTodoDialog {
  BuildContext context;

  AlertTodoDialog(this.context);

  show(
      {required String title,
      required String message,
      String? positiveText,
      String? negativeText,
      VoidCallback? positiveAction,
      VoidCallback? negativeAction}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
              title: Text(title),
              content: SizedBox(
                child: Text(message),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      if (positiveAction != null) positiveAction();
                      Navigator.pop(context);
                    },
                    child: Text(positiveText ?? Strings.LABEL_YES)),
                TextButton(
                    onPressed: () {
                      if (negativeAction != null) negativeAction();
                      Navigator.pop(context);
                    },
                    child: Text(negativeText ?? Strings.LABEL_NO))
              ],
            ));
  }

  showInfo(
      {required String title,
      required String message,
      String? actionText,
      VoidCallback? action}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
              title: Text(title),
              content: SizedBox(
                child: Text(message),
              ),
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                TextButton(
                    onPressed: () {
                      if (action != null) action();
                      Navigator.pop(context);
                    },
                    child: Text(actionText ?? Strings.LABEL_UNDERSTOOD)),
              ],
            ));
  }
}
