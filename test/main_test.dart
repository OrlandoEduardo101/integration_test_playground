import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:integration_test_playground/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    final finder = find.byIcon(Icons.add);
    await tester.tap(finder);
    // await tester.pump();
    await tester.pumpAndSettle(const Duration(seconds: 1));

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);

    await tester.tap(finder);
    await tester.pumpAndSettle(const Duration(seconds: 1));

    // Verify that our counter has incremented.
    expect(find.text('1'), findsNothing);
    expect(find.text('2'), findsOneWidget);
    
    await tester.tap(finder);
    await tester.pumpAndSettle(const Duration(seconds: 1));

    // Verify that our counter has incremented.
    expect(find.text('2'), findsNothing);
    expect(find.text('3'), findsOneWidget);
  });
}
