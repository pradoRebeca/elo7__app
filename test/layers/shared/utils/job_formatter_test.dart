import 'package:flutter_test/flutter_test.dart';
import 'package:elo7_app/layers/domain/models/dto/job_dto.dart';
import 'package:elo7_app/layers/shared/utils/job_formatter.dart';

void main() {
  late JobFormatter jobFormatter;

  setUp(() {
    jobFormatter = JobFormatter();
  });

  group('JobFormatter - Function formatJobs', () {
    test('should format job titles, types, levels, and locations correctly',
        () {
      final jobs = [
        JobDto(
            title: 'software engineer',
            type: 'full time',
            level: 'junior',
            location: 'new york',
            isActive: true),
        JobDto(
            title: 'backend developer',
            type: 'part time',
            level: 'senior',
            location: null,
            isActive: true),
      ];

      final formattedJobs = jobFormatter.formatJobs(jobs);

      expect(formattedJobs.length, 2);
      expect(formattedJobs[0].title, 'Software Engineer');
      expect(formattedJobs[0].type, 'Full Time');
      expect(formattedJobs[0].level, 'Junior');
      expect(formattedJobs[0].location, 'New York');
      expect(formattedJobs[1].location, 'Remoto');
    });

    test('should filter out inactive jobs', () {
      final jobs = [
        JobDto(
            title: 'active job',
            type: 'type1',
            level: 'level1',
            location: 'location1',
            isActive: true),
        JobDto(
            title: 'inactive job',
            type: 'type2',
            level: 'level2',
            location: 'location2',
            isActive: false),
      ];

      final formattedJobs = jobFormatter.formatJobs(jobs);

      expect(formattedJobs.length, 1);
      expect(formattedJobs[0].title, 'Active Job');
    });
  });

  group('JobFormatter - Function filterJobsByQuery', () {
    test('should return jobs that match the query', () {
      final jobs = [
        JobDto(
            title: 'Software Engineer',
            type: 'Full Time',
            level: 'Junior',
            location: 'New York',
            isActive: true),
        JobDto(
            title: 'Backend Developer',
            type: 'Part Time',
            level: 'Senior',
            location: 'Remote',
            isActive: true),
      ];

      final filteredJobs = jobFormatter.filterJobsByQuery(jobs, 'engineer');

      expect(filteredJobs.length, 1);
      expect(filteredJobs[0].title, 'Software Engineer');
    });

    test('should return an empty list if no jobs match the query', () {
      final jobs = [
        JobDto(
            title: 'Software Engineer',
            type: 'Full Time',
            level: 'Junior',
            location: 'New York',
            isActive: true),
        JobDto(
            title: 'Backend Developer',
            type: 'Part Time',
            level: 'Senior',
            location: 'Remote',
            isActive: true),
      ];

      final filteredJobs = jobFormatter.filterJobsByQuery(jobs, 'designer');

      expect(filteredJobs.isEmpty, true);
    });
  });

  group('JobFormatter - Function separateJobsByType', () {
    test('should separate jobs by type correctly', () {
      final jobs = [
        JobDto(
            title: 'Job1',
            type: 'Type1',
            level: 'Junior',
            location: 'Location1',
            isActive: true),
        JobDto(
            title: 'Job2',
            type: 'Type2',
            level: 'Senior',
            location: 'Location2',
            isActive: true),
        JobDto(
            title: 'Job3',
            type: 'Type1',
            level: 'Mid',
            location: 'Location3',
            isActive: true),
      ];

      final separatedJobs = jobFormatter.separateJobsByType(jobs);

      expect(separatedJobs.length, 2);
      expect(separatedJobs['Type1']!.length, 2);
      expect(separatedJobs['Type2']!.length, 1);
    });
  });
}
