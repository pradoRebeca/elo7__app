import 'package:elo7_app/layers/presentation/components/jobs_by_type_card.dart';
import 'package:elo7_app/layers/presentation/components/loading.dart';
import 'package:elo7_app/layers/presentation/components/not_found_card.dart';
import 'package:elo7_app/layers/presentation/components/search_field.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Vagas em aberto",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: SearchField(
              onSearch: controller.searchJobs,
            ),
          ),
          Obx(
            () {
              if (controller.isloading.value) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 40),
                  child: Loading(),
                );
              }

              if (controller.jobs.keys.isNotEmpty) {
                return _buildJobsList(context);
              }

              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 40.0),
                child: NotFoundCard(message: 'Vagas não encontradas'),
              );
            },
          )
        ],
      ),
    );
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
