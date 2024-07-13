import 'package:elo7_app/layers/presentation/components/highlight_image_card.dart';
import 'package:flutter/material.dart';

class Highlight extends StatelessWidget {
  const Highlight({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
      color: Theme.of(context).colorScheme.onPrimary,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          HighlightImageCard(
            fileImageName: 'image_file',
            detail:
                'Donec in vestibulum elit. Aliquam finibus facilisis elit, sit amet malesuada nibh tempor sed. Aliquam consequat ultrices fringilla. Sed id quam sollicitudin mi ultricies feugiat a vel velit. Pellentesque finibus vel tortor sed hendrerit. Vestibulum eu sem sapien.',
            title: 'Resultados',
          ),
          HighlightImageCard(
            fileImageName: 'like',
            detail:
                'Donec in vestibulum elit. Aliquam finibus facilisis elit, sit amet malesuada nibh tempor sed. Aliquam consequat ultrices fringilla. Sed id quam sollicitudin mi ultricies feugiat a vel velit. Pellentesque finibus vel tortor sed hendrerit. Vestibulum eu sem sapien.',
            title: 'Resultados',
            link: 'link',
          ),
          HighlightImageCard(
            fileImageName: 'safe',
            detail:
                'Donec in vestibulum elit. Aliquam finibus facilisis elit, sit amet malesuada nibh tempor sed. Aliquam consequat ultrices fringilla. Sed id quam sollicitudin mi ultricies feugiat a vel velit. Pellentesque finibus vel tortor sed hendrerit. Vestibulum eu sem sapien.',
            title: 'Resultados',
          )
        ],
      ),
    );
  }
}
