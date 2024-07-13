import 'package:flutter/material.dart';

class TitleLinkWebview extends StatelessWidget {
  const TitleLinkWebview({
    super.key,
    required this.title,
    this.link,
  });

  final String title;
  final String? link;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
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
