import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:elo7_app/layers/data/datasources/jobs_datasource.dart';
import 'package:elo7_app/layers/data/repositories/jobs_repository_impl.dart';

import '../../../mock/jobs_response_mock.dart';
import 'jobs_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<JobsDatasource>()])
void main() {
  late JobsRepositoryImpl repository;
  late MockJobsDatasource mockDatasource;

  setUp(() {
    mockDatasource = MockJobsDatasource();
    repository = JobsRepositoryImpl(mockDatasource);
  });

  group('call', () {
    test('should return list of JobDto when datasource returns valid data',
        () async {
      when(mockDatasource()).thenAnswer((_) async => jobsResponseApiMock);

      final result = await repository();

      expect(result.length, 4);
      expect(result[0].title, 'especialista de fp&a');
      expect(result[1].type, 'controles internos');
    });

    test('should throw an exception if datasource throws', () async {
      when(mockDatasource()).thenThrow(Exception('Mock error'));

      final call = repository();

      expect(call, throwsException);
    });
  });
}
