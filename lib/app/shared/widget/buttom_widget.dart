import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:sabetudo/app/shared/utils/appsize.dart';

class ButtomWidget extends StatelessWidget {
  final String texto;
  final VoidCallback function;
  const ButtomWidget(
    this.texto, {
    this.function,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appSize = AppSize(context);
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        width: appSize.width * .95,
        height: appSize.height * .06,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          color: Theme.of(context).primaryColor,
          textColor: Colors.white,
          splashColor: Colors.blueAccent,
          onPressed: function,
          child: AutoSizeText(
            texto,
            maxLines: 1,
            minFontSize: 10,
            textAlign: TextAlign.right,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
