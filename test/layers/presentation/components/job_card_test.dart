import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elo7_app/layers/domain/models/dto/job_dto.dart';
import 'package:elo7_app/layers/presentation/components/job_card.dart';

void main() {
  group('JobCard Widget', () {
    testWidgets('displays job title and level correctly', (tester) async {
      final JobDto jobDto = JobDto(
        title: 'Developer JavaScript',
        type: 'Developer',
        level: 'Senior',
        isActive: true,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: JobCard(jobDto: jobDto),
          ),
        ),
      );

      expect(find.text('Developer JavaScript Senior'), findsOneWidget);
    });

    testWidgets('displays job location if provided', (tester) async {
      final JobDto jobDto = JobDto(
        title: 'Developer C#',
        type: 'Developer',
        level: 'Senior',
        isActive: true,
        location: 'New York',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: JobCard(jobDto: jobDto),
          ),
        ),
      );

      expect(find.text('New York'), findsOneWidget);
    });

    testWidgets('displays "Remoto" if job location is null', (tester) async {
      final JobDto jobDto = JobDto(
        title: 'Developer Front-End',
        type: 'Developer',
        level: 'Senior',
        isActive: true,
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: JobCard(jobDto: jobDto),
          ),
        ),
      );

      expect(find.text('Remoto'), findsOneWidget);
    });
  });
}
