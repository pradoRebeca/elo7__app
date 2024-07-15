import 'package:elo7_app/layers/presentation/components/divider.dart';
import 'package:elo7_app/layers/presentation/components/image_card.dart';
import 'package:elo7_app/layers/presentation/components/title_link_webview.dart';
import 'package:elo7_app/layers/presentation/components/title_section.dart';
import 'package:elo7_app/layers/presentation/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkWithUs extends StatelessWidget {
  const WorkWithUs({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildImageSection(context),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDetailSection(context),
              const SizedBox(
                height: 20,
              ),
              const CustomDivider(),
              const SizedBox(
                height: 20,
              ),
              _buildLinkSection(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildImageSection(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 260,
      child: Stack(
        children: [
          const ImageCard(pathImage: 'assets/images/sellers/team.png'),
          Container(
            color: Colors.black.withOpacity(0.3),
          ),
          const Center(
            child: TitleSection(
              title: 'trabalhe no elo7',
              textStyle: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailSection(BuildContext context) {
    return Obx(
      () {
        final String? detail = controller.workWithUsSection.value.detail;
        if (detail != null && detail.isNotEmpty) {
          return Text(
            detail,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          );
        }

        return Text(
          'Venha fazer parte!',
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        );
      },
    );
  }

  Widget _buildLinkSection() {
    return Obx(
      () => TitleLinkWebview(
        title: 'vagas em aberto',
        link: controller.workWithUsSection.value.link,
      ),
    );
  }
}
