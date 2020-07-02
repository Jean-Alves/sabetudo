import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:sabetudo/app/modules/question/question_controller.dart';
import 'package:sabetudo/app/modules/question/question_module.dart';

void main() {
  initModule(QuestionModule());
  QuestionController question;

  setUp(() {
    question = QuestionModule.to.get<QuestionController>();
  });

  group('QuestionController Test', () {
    test("First Test", () {
      expect(question, isInstanceOf<QuestionController>());
    });

    test("Set Value", () {});
  });
}
