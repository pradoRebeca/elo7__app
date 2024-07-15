import 'package:elo7_app/layers/presentation/components/image_card.dart';
import 'package:elo7_app/layers/presentation/components/title_section.dart';
import 'package:elo7_app/layers/presentation/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MeetOurTeam extends StatelessWidget {
  const MeetOurTeam({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        const TitleSection(
          title: 'Conheça nosso time fora de série',
          textAlign: TextAlign.center,
        ),
        Obx(() => _buildTeamList()),
      ]),
    );
  }

  Widget _buildTeamList() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final pathImage = controller.meetOurTeamSection[index].fileImageName;
        if (pathImage != null && pathImage.isNotEmpty) {
          return _buildTeamImage(pathImage);
        }
        return const SizedBox.shrink();
      },
      separatorBuilder: (context, index) => const SizedBox(height: 24),
      itemCount: controller.meetOurTeamSection.length,
    );
  }

  Widget _buildTeamImage(String pathImage) {
    return SizedBox(
      height: 183,
      child: ImageCard(pathImage: 'assets/images/$pathImage', borderRadius: 16),
    );
  }
}
