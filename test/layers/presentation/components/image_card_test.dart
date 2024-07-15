import 'package:elo7_app/layers/presentation/components/image_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const String imagePathDefault = 'assets/images/sellers/making.png';

  Future<void> pumpImageCard(
      WidgetTester tester, String? imagePath, double? borderRadius) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ImageCard(
            pathImage: imagePath ?? imagePathDefault,
            borderRadius: borderRadius,
          ),
        ),
      ),
    );
  }

  testWidgets('ImageCard renders image correctly', (WidgetTester tester) async {
    await pumpImageCard(tester, null, null);

    expect(find.byType(Image), findsOneWidget);
  });

  testWidgets('ImageCard applies borderRadius correctly',
      (WidgetTester tester) async {
    await pumpImageCard(tester, null, 10);

    final clipRRectWidget = tester.widget<ClipRRect>(find.byType(ClipRRect));
    expect(clipRRectWidget.borderRadius, BorderRadius.circular(10.0));
  });

  testWidgets('ImageCard applies default borderRadius when null',
      (WidgetTester tester) async {
    await pumpImageCard(tester, null, null);

    final clipRRectWidget = tester.widget<ClipRRect>(find.byType(ClipRRect));
    expect(clipRRectWidget.borderRadius, BorderRadius.circular(0.0));
  });

  testWidgets('ImageCard handles image load error',
      (WidgetTester tester) async {
    const String nonExistentImagePath = 'assets/images/nonexistent_image.png';

    await pumpImageCard(tester, nonExistentImagePath, null);

    await tester.pumpAndSettle();

    expect(find.byType(Container), findsOneWidget);
  });
}
