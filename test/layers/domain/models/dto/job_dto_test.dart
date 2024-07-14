import 'package:flutter_test/flutter_test.dart';
import 'package:elo7_app/layers/domain/models/dto/job_dto.dart';

void main() {
  group('JobDto', () {
    test('should create JobDto instance', () {
      final job = JobDto(
        title: 'Software Engineer',
        type: 'Full Time',
        level: 'Junior',
        location: 'New York',
        isActive: true,
      );

      expect(job.title, 'Software Engineer');
      expect(job.type, 'Full Time');
      expect(job.level, 'Junior');
      expect(job.location, 'New York');
      expect(job.isActive, true);
    });

    test('should create JobDto from map', () {
      final map = {
        'title': 'Software Engineer',
        'type': 'Full Time',
        'level': 'Junior',
        'location': 'New York',
        'is_active': true,
      };

      final job = JobDto.fromMap(map);

      expect(job.title, 'Software Engineer');
      expect(job.type, 'Full Time');
      expect(job.level, 'Junior');
      expect(job.location, 'New York');
      expect(job.isActive, true);
    });

    test('should create JobDto from map with null location', () {
      final map = {
        'title': 'Software Engineer',
        'type': 'Full Time',
        'level': 'Junior',
        'location': null,
        'is_active': true,
      };

      final job = JobDto.fromMap(map);

      expect(job.title, 'Software Engineer');
      expect(job.type, 'Full Time');
      expect(job.level, 'Junior');
      expect(job.location, isNull);
      expect(job.isActive, true);
    });
  });
}
