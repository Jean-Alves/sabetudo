import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:sabetudo/app/modules/menu/menu_page.dart';

main() {
  testWidgets('MenuPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(MenuPage(title: 'Menu')));
    final titleFinder = find.text('Menu');
    expect(titleFinder, findsOneWidget);
  });
}
