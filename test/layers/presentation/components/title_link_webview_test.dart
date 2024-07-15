import 'package:elo7_app/layers/presentation/components/title_link_webview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const String title = 'Test Title';

  Future<void> pumpTitleLinkWebview(WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: TitleLinkWebview(title: title),
        ),
      ),
    );
  }

  testWidgets('TitleLinkWebview renders title correctly',
      (WidgetTester tester) async {
    await pumpTitleLinkWebview(tester);

    expect(find.text(title), findsOneWidget);
  });

  testWidgets('TitleLinkWebview renders correct icon',
      (WidgetTester tester) async {
    await pumpTitleLinkWebview(tester);

    expect(find.byIcon(Icons.chevron_right), findsOneWidget);
  });
}
