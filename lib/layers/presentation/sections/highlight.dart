import 'package:elo7_app/layers/presentation/components/highlight_image_card.dart';
import 'package:elo7_app/layers/presentation/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Highlight extends StatelessWidget {
  const Highlight({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
        color: Theme.of(context).colorScheme.onPrimary,
        child: Obx(() => _buildHighLightList()));
  }

  Widget _buildHighLightList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.highlightSection.length,
      itemBuilder: (context, index) => HighlightImageCard(
          sectionDataEntity: controller.highlightSection[index]),
    );
  }
}
