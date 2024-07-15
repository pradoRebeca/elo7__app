import 'package:elo7_app/layers/presentation/components/image_card.dart';
import 'package:elo7_app/layers/presentation/components/jobs_by_type_card.dart';
import 'package:elo7_app/layers/presentation/components/loading.dart';
import 'package:elo7_app/layers/presentation/components/not_found_card.dart';
import 'package:elo7_app/layers/presentation/components/search_field.dart';
import 'package:elo7_app/layers/presentation/components/title_section.dart';
import 'package:elo7_app/layers/presentation/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchJobs extends StatelessWidget {
  const SearchJobs({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          width: double.infinity,
          height: 260,
          child: ImageCard(
            pathImage: 'assets/images/sellers/making.png',
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleSection(title: 'Vagas em aberto'),
              const SizedBox(height: 24),
              SearchField(
                onSearch: controller.searchJobs,
              ),
              Obx(() => _buildJobContent(context))
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildJobContent(BuildContext context) {
    if (controller.isloading.value) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 40),
        child: Loading(),
      );
    } else if (controller.jobs.keys.isNotEmpty) {
      return _buildJobsList(context);
    } else {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 40),
        child: NotFoundCard(message: 'Vaga não encontrada'),
      );
    }
  }

  Widget _buildJobsList(BuildContext context) {
    return ListView.builder(
      itemCount: controller.jobs.keys.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        var type = controller.jobs.keys.elementAt(index);
        var jobsByType = controller.jobs[type]!;

        return JobsByTypeCard(jobs: jobsByType, type: type);
      },
    );
  }
}
