import 'package:elo7_app/layers/presentation/screens/home_screen.dart';
import 'package:elo7_app/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elo 7',
      theme: AppTheme.theme,
      home: const HomeScreen(),
    );
  }
}
