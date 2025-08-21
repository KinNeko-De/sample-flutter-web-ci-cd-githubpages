// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:awesome_app/main.dart';

void main() {
  group('Counter Widget Tests', () {
    testWidgets('Counter starts at zero', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      expect(find.text('0'), findsOneWidget);
    });

    testWidgets('Counter increments when button is pressed', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
      expect(find.text('0'), findsNothing);
      expect(find.text('1'), findsOneWidget);
    });
  });

  testWidgets('Built with Flutter image is present', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    // Look for a network image with the correct URL
    expect(
      find.byWidgetPredicate((widget) =>
        widget is Image &&
        widget.image is NetworkImage &&
        (widget.image as NetworkImage).url == 'https://storage.googleapis.com/cms-storage-bucket/lockup_built-w-flutter.4cdf1c5482cd30174cfe.png'),
      findsOneWidget,
    );
  });

  group('Learning links', () {
    testWidgets('Lab: Write your first Flutter app link is present and tappable', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      // Find the "Lab: Write your first Flutter app" text
      final textFinder = find.text('Lab: Write your first Flutter app');
      expect(textFinder, findsOneWidget);
      // Ensure it is wrapped in an InkWell (tappable)
      final inkWellFinder = find.ancestor(of: textFinder, matching: find.byType(InkWell));
      expect(inkWellFinder, findsOneWidget);
    });

    testWidgets('Cookbook: Useful Flutter samples link is present and tappable', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      // Find the "Cookbook: Useful Flutter samples" text
      final textFinder = find.text('Cookbook: Useful Flutter samples');
      expect(textFinder, findsOneWidget);
      // Ensure it is wrapped in an InkWell (tappable)
      final inkWellFinder = find.ancestor(of: textFinder, matching: find.byType(InkWell));
      expect(inkWellFinder, findsOneWidget);
    });
  });
}
