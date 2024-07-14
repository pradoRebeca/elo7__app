import 'package:flutter/material.dart';

class NotFoundCard extends StatelessWidget {
  const NotFoundCard({super.key, this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(message ?? 'Nenhum resultado encontrado :('));
  }
}
