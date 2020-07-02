import 'package:flutter/material.dart';

okPopup(
    {@required BuildContext context,
    @required String titulo,
    @required String textContext}) async {
  await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(titulo),
          content: Text(textContext),
          actions: <Widget>[
            FlatButton(
              child: Text("OK"),
              onPressed: () async {
                var runnig = true;
                while (runnig) {
                  if (Navigator.of(context).canPop()) {
                    Navigator.of(context).pop();
                  } else {
                    runnig = false;
                  }
                }
              },
            )
          ],
        );
      });
}
