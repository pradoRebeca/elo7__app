import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Get.toNamed('/home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: _buildImageLogo(),
    );
  }

  Widget _buildImageLogo() {
    return Center(
      child: SizedBox(
        width: 200,
        height: 200,
        child: Image.asset(
          'assets/images/app/logo.png',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
