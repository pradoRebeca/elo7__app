import 'package:elo7_app/layers/presentation/components/divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elo7_app/layers/domain/models/dto/job_dto.dart';
import 'package:elo7_app/layers/presentation/components/jobs_by_type_card.dart';
import 'package:elo7_app/layers/presentation/components/job_card.dart';

void main() {
  testWidgets('JobsByTypeCard displays correct type title', (tester) async {
    const String type = 'Type A';
    final List<JobDto> jobs = [
      JobDto(title: 'Job 1', type: 'Type A', level: 'Senior', isActive: true),
      JobDto(title: 'Job 2', type: 'Type A', level: 'Junior', isActive: false),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: JobsByTypeCard(jobs: jobs, type: type),
        ),
      ),
    );

    expect(find.text(type), findsOneWidget);
  });

  testWidgets('JobsByTypeCard displays all jobs', (tester) async {
    const String type = 'Type A';
    final List<JobDto> jobs = [
      JobDto(title: 'Job 1', type: 'Type A', level: 'Senior', isActive: true),
      JobDto(title: 'Job 2', type: 'Type A', level: 'Junior', isActive: false),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: JobsByTypeCard(jobs: jobs, type: type),
        ),
      ),
    );

    expect(find.byType(JobCard), findsNWidgets(jobs.length));
  });

  testWidgets('JobsByTypeCard displays correct number of dividers',
      (tester) async {
    const String type = 'Type A';
    final List<JobDto> jobs = [
      JobDto(title: 'Job 1', type: 'Type A', level: 'Senior', isActive: true),
      JobDto(title: 'Job 2', type: 'Type A', level: 'Junior', isActive: false),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: JobsByTypeCard(jobs: jobs, type: type),
        ),
      ),
    );

    expect(find.byType(CustomDivider), findsOneWidget);
  });
}
