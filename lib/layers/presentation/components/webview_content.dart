import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewContent extends StatefulWidget {
  const WebViewContent({super.key, required this.controller});

  final WebViewController controller;

  @override
  State<WebViewContent> createState() => _WebViewContentState();
}

class _WebViewContentState extends State<WebViewContent> {
  int loadingPercentage = 0;

  @override
  void initState() {
    super.initState();

    _setupWebView();
  }

  void _setupWebView() {
    widget.controller
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (String url) => _changePercentageValue(0),
        onProgress: (int progress) => _changePercentageValue(progress),
        onPageFinished: (String url) => _changePercentageValue(100),
      ))
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
  }

  void _changePercentageValue(int percentage) {
    setState(() {
      loadingPercentage = percentage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebViewWidget(controller: widget.controller),
        if (loadingPercentage < 100)
          LinearProgressIndicator(
            value: loadingPercentage / 100.0,
          )
      ],
    );
  }
}
