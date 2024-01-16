import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomAlert extends StatelessWidget {
  CustomAlert({this.title, this.content, this.onTap});

  String? title;
  String? content;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title ?? "",
        textAlign: TextAlign.center,
      ),
      content: Text(
        content ?? "",
        textAlign: TextAlign.center,
      ),
      actions: [
        TextButton(
          child: Text("Đóng"),
          // onPressed: () {
          //   // Navigator.of(context).pop();
          // },
          onPressed: onTap,
        ),
      ],
    );
  }
}

class CustomAlertOK extends StatelessWidget {
  CustomAlertOK({this.title, this.content, this.onTap});

  String? title;
  String? content;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title ?? "",
        textAlign: TextAlign.center,
      ),
      content: Text(
        content ?? "",
        textAlign: TextAlign.center,
      ),
      actions: [
        TextButton(
          child: Text("Đồng ý"),
          // onPressed: () {
          //   // Navigator.of(context).pop();
          // },
          onPressed: onTap,
        ),
      ],
    );
  }
}
