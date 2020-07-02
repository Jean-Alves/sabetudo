// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$QuestionController on _QuestionBase, Store {
  Computed<int> _$totalQuestionsComputed;

  @override
  int get totalQuestions =>
      (_$totalQuestionsComputed ??= Computed<int>(() => super.totalQuestions,
              name: '_QuestionBase.totalQuestions'))
          .value;
  Computed<double> _$percentageQuestionComputed;

  @override
  double get percentageQuestion => (_$percentageQuestionComputed ??=
          Computed<double>(() => super.percentageQuestion,
              name: '_QuestionBase.percentageQuestion'))
      .value;

  final _$listQuestionsAtom = Atom(name: '_QuestionBase.listQuestions');

  @override
  List<QuestionModel> get listQuestions {
    _$listQuestionsAtom.reportRead();
    return super.listQuestions;
  }

  @override
  set listQuestions(List<QuestionModel> value) {
    _$listQuestionsAtom.reportWrite(value, super.listQuestions, () {
      super.listQuestions = value;
    });
  }

  final _$indexQuestionAtom = Atom(name: '_QuestionBase.indexQuestion');

  @override
  int get indexQuestion {
    _$indexQuestionAtom.reportRead();
    return super.indexQuestion;
  }

  @override
  set indexQuestion(int value) {
    _$indexQuestionAtom.reportWrite(value, super.indexQuestion, () {
      super.indexQuestion = value;
    });
  }

  final _$timerAtom = Atom(name: '_QuestionBase.timer');

  @override
  int get timer {
    _$timerAtom.reportRead();
    return super.timer;
  }

  @override
  set timer(int value) {
    _$timerAtom.reportWrite(value, super.timer, () {
      super.timer = value;
    });
  }

  final _$countCorrectAnswerAtom =
      Atom(name: '_QuestionBase.countCorrectAnswer');

  @override
  int get countCorrectAnswer {
    _$countCorrectAnswerAtom.reportRead();
    return super.countCorrectAnswer;
  }

  @override
  set countCorrectAnswer(int value) {
    _$countCorrectAnswerAtom.reportWrite(value, super.countCorrectAnswer, () {
      super.countCorrectAnswer = value;
    });
  }

  final _$_QuestionBaseActionController =
      ActionController(name: '_QuestionBase');

  @override
  bool nextQuestion(bool isCorrectAnswer) {
    final _$actionInfo = _$_QuestionBaseActionController.startAction(
        name: '_QuestionBase.nextQuestion');
    try {
      return super.nextQuestion(isCorrectAnswer);
    } finally {
      _$_QuestionBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listQuestions: ${listQuestions},
indexQuestion: ${indexQuestion},
timer: ${timer},
countCorrectAnswer: ${countCorrectAnswer},
totalQuestions: ${totalQuestions},
percentageQuestion: ${percentageQuestion}
    ''';
  }
}
