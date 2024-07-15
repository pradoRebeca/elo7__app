import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elo7_app/layers/presentation/components/not_found_card.dart';

void main() {
  group('NotFoundCard Widget', () {
    testWidgets('displays the provided message', (tester) async {
      const message = 'Custom not found message';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NotFoundCard(message: message),
          ),
        ),
      );

      expect(find.text(message), findsOneWidget);
    });

    testWidgets('displays the default message when none is provided',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NotFoundCard(),
          ),
        ),
      );

      expect(find.text('Nenhum resultado encontrado :('), findsOneWidget);
    });
  });
}
