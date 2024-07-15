import 'package:elo7_app/layers/domain/models/entities/section_data_entity.dart';
import 'package:elo7_app/layers/presentation/components/image_card.dart';
import 'package:elo7_app/layers/presentation/components/title_link_webview.dart';
import 'package:flutter/material.dart';

class HighlightImageCard extends StatelessWidget {
  const HighlightImageCard({
    super.key,
    required this.sectionDataEntity,
  });

  final SectionDataEntity sectionDataEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (sectionDataEntity.fileImageName != null &&
              sectionDataEntity.fileImageName!.isNotEmpty)
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
                child: ImageCard(
                  pathImage: 'assets/images/${sectionDataEntity.fileImageName}',
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text(
              sectionDataEntity.title ?? '',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Text(
            sectionDataEntity.detail ?? '',
            textAlign: TextAlign.center,
          ),
          if (sectionDataEntity.link != null)
            const Padding(
              padding: EdgeInsets.only(top: 24),
              child: TitleLinkWebview(title: 'saiba mais'),
            )
        ],
      ),
    );
  }
}
