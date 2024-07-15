import 'package:elo7_app/layers/presentation/components/webview_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController controller;
  final arguments = Get.arguments as Map<String, dynamic>;
  late String link = arguments['link'];
  late String title = arguments['title'];

  @override
  void initState() {
    super.initState();

    link = arguments['link'];
    title = arguments['title'];

    controller = WebViewController()..loadRequest(Uri.parse(link));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _buildTitleAppBar(context),
      ),
      body: WebViewContent(
        controller: controller,
      ),
    );
  }

  Widget _buildTitleAppBar(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .bodyMedium
          ?.merge(const TextStyle(fontWeight: FontWeight.w700)),
    );
  }
}
