import 'package:elo7_app/layers/presentation/components/title_link_webview.dart';
import 'package:flutter/material.dart';

class HighlightImageCard extends StatelessWidget {
  const HighlightImageCard({
    super.key,
    required this.fileImageName,
    required this.title,
    required this.detail,
    this.link,
  });

  final String fileImageName;
  final String title;
  final String detail;
  final String? link;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 200,
            width: 200,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Theme.of(context).colorScheme.primary),
            child: SizedBox(
              height: 135,
              width: 135,
              child: Image.asset(
                'assets/images/highlight/$fileImageName.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Text(
            detail,
            textAlign: TextAlign.center,
          ),
          if (link != null)
            const Padding(
              padding: EdgeInsets.only(top: 24),
              child: TitleLinkWebview(title: 'saiba mais'),
            )
        ],
      ),
    );
  }
}
