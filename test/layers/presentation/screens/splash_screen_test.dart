import 'package:elo7_app/layers/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('SplashScreen displays logo and navigates after delay',
      (WidgetTester tester) async {
    await tester.pumpWidget(GetMaterialApp(
      home: const SplashScreen(),
      getPages: [
        GetPage(
            name: '/home', page: () => const Scaffold(body: Text('Home Page'))),
      ],
    ));

    expect(find.byType(Image), findsOneWidget);
    expect(find.byType(SizedBox), findsOneWidget);

    await tester.pumpAndSettle(const Duration(seconds: 2));

    expect(find.text('Home Page'), findsOneWidget);
  });
}
