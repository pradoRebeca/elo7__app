import 'package:elo7_app/layers/presentation/components/divider.dart';
import 'package:elo7_app/layers/presentation/components/job_card.dart';
import 'package:flutter/material.dart';

class SearchJobs extends StatelessWidget {
  const SearchJobs({super.key});

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
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              "Desenvolvimento",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          ListView.separated(
              shrinkWrap: true, // Importante para evitar erro de layout
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return const JobCard();
              },
              separatorBuilder: (context, index) => const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: CustomDivider(),
                  ),
              itemCount: 5)
        ],
      ),
    );
  }
}
