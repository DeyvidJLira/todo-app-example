import 'package:flutter/material.dart';
import 'package:todo_app_example/strings.dart';

class ProgressDialog {
  BuildContext context;
  bool _isShowing = false;

  ProgressDialog(this.context);

  void show() {
    if (_isShowing) return;
    _isShowing = true;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
              backgroundColor: Colors.blue,
              content: SizedBox(
                height: 140,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      Strings.LABEL_PROCESSING,
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ));
  }

  void hide() {
    if (!_isShowing) return;
    _isShowing = false;
    Navigator.pop(context);
  }
}
