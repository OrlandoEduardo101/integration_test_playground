// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test_playground/main.dart';
import 'package:patrol/patrol.dart';

void main() {
  // IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  patrolTest(
    'Counter increments smoke test',
    nativeAutomation: true,
    nativeAutomatorConfig: const NativeAutomatorConfig(
      packageName: 'com.example.integration_test_playground',
      bundleId: 'com.example.integration_test_playground',
    ),
    (tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      // Verify that our counter starts at 0.
      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);

      // Tap the '+' icon and trigger a frame.
      final finder = find.byIcon(Icons.add);
      await tester.tap(finder);
      // await tester.pump();
      await tester.pumpAndSettle(duration: const Duration(seconds: 1));

      // Verify that our counter has incremented.
      expect(find.text('0'), findsNothing);
      expect(find.text('1'), findsOneWidget);

      await tester.tap(finder);
      await tester.pumpAndSettle(duration: const Duration(seconds: 1));

      // Verify that our counter has incremented.
      expect(find.text('1'), findsNothing);
      expect(find.text('2'), findsOneWidget);

      await tester.tap(finder);
      await tester.pumpAndSettle(duration: const Duration(seconds: 1));

      // Verify that our counter has incremented.
      expect(find.text('2'), findsNothing);
      expect(find.text('3'), findsOneWidget);
    },
  );
}

// https://patrol.leancode.co/
// patrol test android --target test/widget_patrol_test.dart
// patrol test android --target integration_test/widget_patrol_test.dart
// windows: patrol test android --target integration_test\widget_patrol_test.dart
// windows: patrol build android --target integration_test\widget_patrol_test.dart
// gcloud firebase test android run --type instrumentation --app build/app/outputs/apk/debug/app-debug.apk --test build/app/outputs/apk/androidTest/debug/app-debug-androidTest.apk --timeout 1m 
