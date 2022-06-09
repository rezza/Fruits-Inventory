import 'package:flutter/material.dart';

class Dialogs {
  static void showProgressDialog (BuildContext context) {
    showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
        content:  Row(
          children: [
            const CircularProgressIndicator(),
            Container(margin: const EdgeInsets.only(left: 7), child: const Text("Loading..." )),
          ],),
      ),
    );
  }

  static void showGlobalDialog(
      BuildContext context,
      String title,
      String description,
      bool useCancel,
      Function() onConfirm,
      ) {
    showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title),
        content: Text(description),
        actions: <Widget>[
          Visibility(
              visible: useCancel,
              child: TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              )),
          TextButton(
            onPressed: onConfirm,
            child: const Text('close'),
          ),
        ],
      ),
    );
  }

  static void showGlobalDialogCustomText(
      BuildContext context,
      String title,
      String description,
      bool useCancel,
      Function() onConfirm,
      String textOK,
      String textNO,
      Function()? onCancel,
      ) {
    showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title),
        content: Text(description),
        actions: <Widget>[
          Visibility(
              visible: useCancel,
              child: TextButton(
                onPressed: onCancel ?? () => Navigator.pop(context, 'Cancel'),
                child: Text(textNO),
              )),
          TextButton(
            onPressed: onConfirm,
            child: Text(textOK),
          ),
        ],
      ),
    );
  }
}