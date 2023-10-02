import 'package:flutter/material.dart';

alertPopup(
  BuildContext context, {
  required String title,
  required String message,
  required void Function()? onPressedYes,
  required void Function()? onPressedNo,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(child: Text('Yes'), onPressed: onPressedYes),
          TextButton(child: Text('No'), onPressed: onPressedNo),
        ],
      );
    },
  );
}
