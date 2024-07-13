import 'package:elo7_app/layers/presentation/sections/highlight.dart';
import 'package:elo7_app/layers/presentation/sections/meet_our_team.dart';
import 'package:elo7_app/layers/presentation/sections/search_jobs.dart';
import 'package:elo7_app/layers/presentation/sections/seller_statement.dart';
import 'package:elo7_app/layers/presentation/sections/work_with_us.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const WorkWithUs(),
            const SellerStatement(),
            const MeetOurTeam(),
            const Highlight(),
            SearchJobs()
          ],
        ),
      ),
    );
  }
}
