import 'package:elo7_app/layers/presentation/components/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SearchField', () {
    testWidgets('calls onSearch when submit button is pressed', (tester) async {
      String? searchText;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SearchField(
              onSearch: (text) {
                searchText = text;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.search));
      expect(searchText, isEmpty);

      await tester.enterText(find.byType(TextField), 'Job title');
      await tester.testTextInput.receiveAction(TextInputAction.search);
      expect(searchText, 'Job title');
    });

    testWidgets('calls onSearch when icon button Search is pressed',
        (tester) async {
      String? searchText;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SearchField(
              onSearch: (text) {
                searchText = text;
              },
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), 'Job title');
      await tester.tap(find.byIcon(Icons.search));

      expect(searchText, 'Job title');
    });
  });
}
