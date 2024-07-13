import 'package:flutter/material.dart';

class JobCard extends StatelessWidget {
  const JobCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Text(
            "Desenvolvedor(a) Mobile Senior (Android e iOS)",
            style: Theme.of(context).textTheme.bodyLarge?.merge(
                TextStyle(color: Theme.of(context).colorScheme.tertiary)),
          ),
        ),
        Text('São Paulo, Brasil', style: Theme.of(context).textTheme.bodyLarge)
      ],
    );
  }
}
