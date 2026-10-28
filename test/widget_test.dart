// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:restaurant_menu/main.dart';

void main() {
  testWidgets('shows the drinks menu and opens drink details', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const AirBalangApp());

    expect(find.text('Air Balang Restaurant'), findsOneWidget);
    expect(find.text('Air Coklat'), findsOneWidget);
    expect(find.text('Air Bandung'), findsOneWidget);
    expect(find.text('Air Limau'), findsOneWidget);

    await tester.tap(find.text('Air Coklat'));
    await tester.pumpAndSettle();

    expect(find.text('Main Ingredients'), findsOneWidget);
    expect(find.textContaining('Chocolate powder or cocoa powder'), findsOneWidget);
  });
}
