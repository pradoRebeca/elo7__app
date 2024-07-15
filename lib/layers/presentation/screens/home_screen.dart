import 'package:elo7_app/layers/presentation/controller/home_controller.dart';
import 'package:elo7_app/layers/presentation/sections/highlight.dart';
import 'package:elo7_app/layers/presentation/sections/meet_our_team.dart';
import 'package:elo7_app/layers/presentation/sections/search_jobs.dart';
import 'package:elo7_app/layers/presentation/sections/seller_statement.dart';
import 'package:elo7_app/layers/presentation/sections/work_with_us.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController _homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            WorkWithUs(
              controller: _homeController,
            ),
            SellerStatement(controller: _homeController),
            MeetOurTeam(controller: _homeController),
            Highlight(controller: _homeController),
            SearchJobs(
              controller: _homeController,
            ),
          ],
        ),
      ),
    );
  }
}
