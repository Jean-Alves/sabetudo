import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sabetudo/app/modules/question/question_controller.dart';
import 'package:sabetudo/app/modules/question/question_module.dart';
import 'package:sabetudo/app/shared/google/admob/admob.dart';
import 'package:sabetudo/app/shared/popups/ok_popup.dart';

import 'package:sabetudo/app/shared/utils/appsize.dart';
import 'package:sabetudo/app/shared/widget/buttom_widget.dart';

class QuestionPage extends StatefulWidget {
  final String title;
  const QuestionPage({Key key, this.title = "FUTEBOL"}) : super(key: key);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final controller = QuestionModule.to.get<QuestionController>();
  Timer timer;
  @override
  void initState() {
    super.initState();
    startBanner();
    displayBanner();
    timer = timerQuestion();
  }

  @override
  void dispose() {
    bannerDispose();
    timer?.cancel();
    super.dispose();
  }

  Timer timerQuestion() {
    return Timer.periodic(Duration(seconds: 1), (timerIn) async {
      if (timerIn.tick >= 15) {
        timerIn.cancel();
        timer?.cancel();
        var haveNextQuestion = controller.nextQuestion(false);

        if (haveNextQuestion) {
          timer = timerQuestion();
        } else {
          buildPopUp();
        }
      } else {
        controller.timer = controller.timer - 1;
      }
    });
  }

  buildPopUp() {
    okPopup(
      context: context,
      titulo: "Fim",
      textContext:
          "Você acertou ${controller.countCorrectAnswer} de ${controller.listQuestions?.length}",
    );
  }

  Future<bool> _willPopCallback() async {
//gravar aqui
    return true; // return true if the route to be popped
  }

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      centerTitle: true,
      title: Text(widget.title),
    );
    var appSize = AppSize(context, appBarEnabled: true);

    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
        appBar: appBar,
        body: Padding(
          padding: EdgeInsets.only(bottom: appSize.height * .1),
          child: Observer(builder: (_) {
            if (controller.listQuestions == null ||
                controller.listQuestions.length == 0) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            var question = controller.listQuestions[controller.indexQuestion];
            var linearText =
                "${(controller.indexQuestion + 1).toString()} / ${controller.totalQuestions.toString()}";
            return Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 3,
                  ),
                  child: LinearPercentIndicator(
                    width: appSize.width - 6,
                    animation: false,
                    lineHeight: 20.0,
                    animationDuration: 2500,
                    percent: controller.percentageQuestion,
                    center: Text(linearText),
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    progressColor: Colors.green,
                  ),
                ),
                Visibility(
                  visible: question.image != null,
                  child: Card(
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
                              question.texto,
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
                                backgroundColor: controller.timer > 5
                                    ? Colors.green
                                    : Colors.red,
                                child: Text(
                                  controller.timer.toString(),
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
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: question.botoes.length,
                    itemBuilder: (_, index) {
                      var botao = question.botoes[index];
                      return ButtomWidget(
                        botao.text,
                        function: () {
                          timer?.cancel();
                          timer = timerQuestion();
                          var haveNextQuestion =
                              controller.nextQuestion(botao.isCorrect);
                          if (!haveNextQuestion) {
                            buildPopUp();
                          }
                        },
                      );
                    }),
              ],
            );
          }),
        ),
      ),
    );
  }
}
