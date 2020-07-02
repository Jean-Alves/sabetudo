import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sabetudo/app/shared/utils/appsize.dart';

import 'buttom_widget.dart';

class QuestionWidget extends StatefulWidget {
  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  @override
  Widget build(BuildContext context) {
    var appSize = AppSize(context, appBarEnabled: true);
    return Column(
      children: <Widget>[
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          elevation: 20,
          child: Image.asset(
            "assets/images/ladrao.png",
            width: appSize.width * .9,
            height: appSize.height * .28,
          ),
        ),
        // Card(
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.all(Radius.circular(10)),
        //   ),
        //   elevation: 20,
        //   child: Container(
        //     width: appSize.width * .9,
        //     height: appSize.height * .28,
        //     decoration: BoxDecoration(
        //         image: DecorationImage(
        //             image: AssetImage("assets/images/ladrao.png"),
        //             fit: BoxFit.fill)),
        //   ),
        // ),
        Expanded(
          child: Container(
            width: appSize.width * .9,
            child: Row(
              children: <Widget>[
                Flexible(
                  child: Center(
                    child: AutoSizeText(
                      "Qual time do futebol brasileiro tem a torcida considerada de ladrão? aersgtfy th th gwrf ethdgrstg ",
                      maxLines: 3,
                      minFontSize: 10,
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ),
                Observer(
                  builder: (_) {
                    return Container(
                      width: 40,
                      child: CircleAvatar(
                        backgroundColor: Colors.green,
                        child: Text(
                          '15',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        ButtomWidget("TESTE"),
        ButtomWidget("TESTE"),
        ButtomWidget("TESTE"),
        ButtomWidget("TESTE"),
      ],
    );
  }
}
