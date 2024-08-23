import 'package:flutter/material.dart';

class popUpMsg {
  popUpMsg({
    required BuildContext context,
    required String title,
    required String content,
    required Widget nextPage,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => nextPage),
              );
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
