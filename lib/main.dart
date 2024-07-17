import 'package:elo7_app/layers/presentation/bindings/initial_binding.dart';
import 'package:elo7_app/layers/presentation/screens/home_screen.dart';
import 'package:elo7_app/layers/presentation/screens/web_view_screen.dart';
import 'package:elo7_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Elo7',
      theme: AppTheme.theme,
      initialRoute: '/',
      initialBinding: InitialBinding(),
      getPages: [
        GetPage(name: '/', page: () => HomeScreen()),
        GetPage(name: '/webview', page: () => const WebViewScreen())
      ],
    );
  }
}
