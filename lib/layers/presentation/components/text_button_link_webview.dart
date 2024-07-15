import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextButtonLinkWebview extends StatelessWidget {
  const TextButtonLinkWebview({
    super.key,
    required this.title,
    this.link,
    this.titleWebLink,
  });

  final String title;
  final String? titleWebLink;
  final String? link;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Get.toNamed('/webview',
              arguments: {'link': link, 'title': titleWebLink});
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium?.merge(
                    TextStyle(color: Theme.of(context).colorScheme.tertiary)),
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: Theme.of(context).colorScheme.tertiary,
            )
          ],
        ));
  }
}
