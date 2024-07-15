import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  const TitleSection(
      {super.key, this.textAlign, this.textStyle, required this.title});

  final String title;
  final TextAlign? textAlign;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge?.merge(textStyle),
      textAlign: textAlign,
    );
  }
}
