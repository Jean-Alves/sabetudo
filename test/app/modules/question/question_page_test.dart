import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:sabetudo/app/modules/question/question_page.dart';

main() {
  testWidgets('QuestionPage has title', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(QuestionPage(title: 'Question')));
    final titleFinder = find.text('Question');
    expect(titleFinder, findsOneWidget);
  });
}
