import 'package:elo7_app/layers/presentation/components/jobs_by_type_card.dart';
import 'package:elo7_app/layers/presentation/components/search_field.dart';
import 'package:flutter/material.dart';

import 'package:elo7_app/layers/domain/models/dto/job_dto.dart';

class SearchJobs extends StatelessWidget {
  const SearchJobs({
    super.key,
    required this.jobs,
    required this.onSearch,
  });

  final Map<String, List<JobDto>> jobs;
  final void Function(String text) onSearch;

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
              onSearch: onSearch,
            ),
          ),
          if (jobs.keys.isNotEmpty) _buildJobsList(context),
          if (jobs.keys.isEmpty)
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Center(child: Text('Vagas não encontradas')),
            )
        ],
      ),
    );
  }

  Widget _buildJobsList(BuildContext context) {
    return ListView.builder(
      itemCount: jobs.keys.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        var type = jobs.keys.elementAt(index);
        var jobsByType = jobs[type]!;

        return JobsByTypeCard(jobs: jobsByType, type: type);
      },
    );
  }
}
