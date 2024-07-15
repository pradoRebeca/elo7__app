import 'package:elo7_app/layers/domain/models/dto/job_dto.dart';
import 'package:elo7_app/layers/presentation/components/divider.dart';
import 'package:elo7_app/layers/presentation/components/job_card.dart';
import 'package:flutter/material.dart';

class JobsByTypeCard extends StatelessWidget {
  const JobsByTypeCard({super.key, required this.jobs, required this.type});

  final List<JobDto> jobs;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            type,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => ListTile(
            title: JobCard(jobDto: jobs[index]),
          ),
          separatorBuilder: (context, index) => const CustomDivider(),
          itemCount: jobs.length,
        ),
      ],
    );
  }
}
