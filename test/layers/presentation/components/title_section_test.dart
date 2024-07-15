import 'package:elo7_app/layers/presentation/components/title_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('TitleSection renders text correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: TitleSection(title: 'Test Title'),
        ),
      ),
    );

    expect(find.text('Test Title'), findsOneWidget);
  });

  testWidgets('TitleSection applies custom textAlign',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: TitleSection(
            title: 'Test Title',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );

    final textWidget = tester.widget<Text>(find.byType(Text));
    expect(textWidget.textAlign, TextAlign.center);
  });

  testWidgets('TitleSection applies custom textStyle',
      (WidgetTester tester) async {
    const customTextStyle = TextStyle(color: Colors.red);

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: TitleSection(
            title: 'Test Title',
            textStyle: customTextStyle,
          ),
        ),
      ),
    );

    final textWidget = tester.widget<Text>(find.byType(Text));
    expect(textWidget.style!.color, Colors.red);
  });

  testWidgets('TitleSection applies theme style if no custom style provided',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(
          textTheme: const TextTheme(
            titleLarge: TextStyle(fontSize: 20.0),
          ),
        ),
        home: const Scaffold(
          body: TitleSection(title: 'Test Title'),
        ),
      ),
    );

    final textWidget = tester.widget<Text>(find.byType(Text));
    expect(textWidget.style!.fontSize, 20.0);
  });
}
