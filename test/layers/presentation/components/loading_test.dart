import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elo7_app/layers/presentation/components/loading.dart';

void main() {
  group('Loading Widget', () {
    testWidgets('displays a CircularProgressIndicator', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Loading(),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byType(Center), findsOneWidget);
    });
  });
}
