import 'package:mobx/mobx.dart';
import 'package:sabetudo/app/shared/models/botoes_model.dart';
import 'package:sabetudo/app/shared/models/question_model.dart';

part 'question_controller.g.dart';

class QuestionController = _QuestionBase with _$QuestionController;

abstract class _QuestionBase with Store {
  _QuestionBase() {
    _init();
  }

  _init() {
    var botoes = List<BotoesModel>();
    botoes.add(BotoesModel("RESPOSTA 1", true));
    botoes.add(BotoesModel("RESPOSTA 2", false));
    botoes.add(BotoesModel("RESPOSTA 2", false));
    botoes.add(BotoesModel("RESPOSTA 2", false));
    var list = List<QuestionModel>();

    list.add(QuestionModel(
        categoria: "FUTEBOL",
        texto: "TESTE",
        image: "assets/images/ladrao.png",
        botoes: botoes));

    list.add(QuestionModel(
      categoria: "HQ",
      texto: "Esse é 1 teste sem a imagem",
      botoes: botoes,
    ));
    list.add(QuestionModel(
        categoria: "HISTÓRIA",
        texto: "TESTE 3",
        image: "assets/images/ladrao.png",
        botoes: botoes));

    listQuestions = list;
  }

  @observable
  List<QuestionModel> listQuestions = List<QuestionModel>();

  @computed
  int get totalQuestions => listQuestions.length;

  @computed
  double get percentageQuestion => ((indexQuestion + 1) / listQuestions.length);

  @observable
  int indexQuestion = 0;

  @observable
  int timer = 15;

  @observable
  int countCorrectAnswer = 0;

  @action
  bool nextQuestion(bool isCorrectAnswer) {
    if (isCorrectAnswer) {
      countCorrectAnswer++;
    }
    timer = 15;
    if (indexQuestion < totalQuestions - 1) {
      indexQuestion++;
      return true;
    }
    return false;
  }
}
