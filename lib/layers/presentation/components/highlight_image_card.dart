import 'package:flutter/material.dart';
import 'package:elo7_app/layers/domain/models/entities/section_data_entity.dart';
import 'package:elo7_app/layers/presentation/components/image_card.dart';
import 'package:elo7_app/layers/presentation/components/text_button_link_webview.dart';

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
          _buildImageSection(context),
          _buildTitleSection(context),
          _buildDetailSection(),
          _buildLinkSection(),
        ],
      ),
    );
  }

  Widget _buildImageSection(BuildContext context) {
    if (sectionDataEntity.fileImageName != null &&
        sectionDataEntity.fileImageName!.isNotEmpty) {
      return Container(
        height: 200,
        width: 200,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: SizedBox(
          height: 135,
          width: 135,
          child: ImageCard(
            pathImage: 'assets/images/${sectionDataEntity.fileImageName}',
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildTitleSection(BuildContext context) {
    if (sectionDataEntity.title != null &&
        sectionDataEntity.title!.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Text(
          sectionDataEntity.title!,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildDetailSection() {
    if (sectionDataEntity.detail != null &&
        sectionDataEntity.detail!.isNotEmpty) {
      return Text(
        sectionDataEntity.detail!,
        textAlign: TextAlign.center,
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildLinkSection() {
    if (sectionDataEntity.link != null && sectionDataEntity.titleLink != null) {
      return Padding(
        padding: const EdgeInsets.only(top: 24),
        child: TextButtonLinkWebview(
          title: 'saiba mais',
          titleWebLink: sectionDataEntity.titleLink,
          link: sectionDataEntity.link,
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
