import 'package:elo7_app/layers/presentation/components/divider.dart';
import 'package:elo7_app/layers/presentation/components/title_link_webview.dart';
import 'package:flutter/material.dart';

class WorkWithUs extends StatelessWidget {
  const WorkWithUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 260,
          child: Stack(
            children: [
              Image.asset(
                'assets/images/sellers/team.png',
                fit: BoxFit.cover,
              ),
              Container(
                color: Colors.black.withOpacity(0.3),
              ),
              Center(
                child: Text("trabalhe no elo7",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.merge(const TextStyle(color: Colors.white))),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          child: Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur et viverra orci. Praesent consequat dolor tellus, eget viverra risus hendrerit non. Sed rutrum condimentum maximus. Donec pellentesque libero eu eros sagittis.',
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ),
        const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CustomDivider()),
        const Padding(
          padding: EdgeInsets.only(top: 30, bottom: 50),
          child: TitleLinkWebview(
            title: 'vagas em aberto',
          ),
        ),
      ],
    );
  }
}
