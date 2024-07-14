import 'package:elo7_app/layers/domain/models/dto/job_dto.dart';
import 'package:flutter/material.dart';

class JobCard extends StatelessWidget {
  const JobCard({
    super.key,
    required this.jobDto,
  });

  final JobDto jobDto;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(
            "${jobDto.title} ${jobDto.level}",
            style: Theme.of(context).textTheme.bodyLarge?.merge(
                TextStyle(color: Theme.of(context).colorScheme.tertiary)),
          ),
        ),
        Text(jobDto.location ?? 'Remoto',
            style: Theme.of(context).textTheme.bodyLarge)
      ],
    );
  }
}
