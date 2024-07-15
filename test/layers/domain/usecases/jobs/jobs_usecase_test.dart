import 'package:elo7_app/layers/data/datasources/jobs_datasource.dart';
import 'package:elo7_app/layers/data/repositories/jobs_repository_impl.dart';
import 'package:elo7_app/layers/domain/models/dto/job_dto.dart';
import 'package:elo7_app/layers/domain/repositories/jobs_repository.dart';
import 'package:elo7_app/layers/domain/usecases/jobs/jobs_usecase.dart';
import 'package:elo7_app/layers/domain/usecases/jobs/jobs_usecase_impl.dart';
import 'package:elo7_app/layers/shared/utils/job_formatter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../mock/jobs_response_mock.dart';
import 'jobs_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<JobsDatasource>()])
void main() {
  late JobsDatasource jobsDatasource;
  late JobsRepository jobsRepository;
  late JobsUsecase jobsUsecase;

  setUp(() {
    jobsDatasource = MockJobsDatasource();
    jobsRepository = JobsRepositoryImpl(jobsDatasource);
    jobsUsecase = JobsUsecaseImpl(jobsRepository, JobFormatter());
  });

  group(
    'Jobs Usecase - Function call',
    () {
      test('should return success and body with map in case of success',
          () async {
        when(jobsDatasource()).thenAnswer((_) async => jobsResponseApiMock);

        var responseUsecase = await jobsUsecase(null);

        expect(responseUsecase.success, isTrue);
        expect(responseUsecase.body, isA<Map<String, List<JobDto>>>());
      });

      test('should return top 3 formatted jobs when query is null', () async {
        when(jobsDatasource()).thenAnswer((_) async => jobsResponseApiMock);

        var responseUsecase = await jobsUsecase(null);
        var responseBody = responseUsecase.body as Map<String, List<JobDto>>;

        expect(responseBody.length, 3);
      });

      test('should return top 3 formatted jobs when query is empty', () async {
        when(jobsDatasource()).thenAnswer((_) async => jobsResponseApiMock);

        var responseUsecase = await jobsUsecase(null);
        var responseBody = responseUsecase.body as Map<String, List<JobDto>>;

        expect(responseBody.length, 3);
      });

      test('should return formatted jobs', () async {
        when(jobsDatasource()).thenAnswer((_) async => jobsResponseApiMock);

        var responseUsecase = await jobsUsecase('estágio');

        var responseBody = responseUsecase.body as Map<String, List<JobDto>>;
        var firstResponse = responseBody.keys.toList().first;

        expect(firstResponse, 'Controles Internos');

        var job = responseBody[firstResponse]?[0] as JobDto;

        expect(job.title, 'Estágio Em Riscos E Controles Internos');
        expect(job.type, 'Controles Internos');
        expect(job.level, 'Estágio');
        expect(job.location, 'São Paulo, Sp, Brasil');
        expect(job.isActive, true);
      });

      test(
          'should return an empty map if data is not compatible with the search query',
          () async {
        when(jobsDatasource()).thenAnswer((_) async => jobsResponseApiMock);

        var responseUsecase = await jobsUsecase('query');

        expect(responseUsecase.body, {});
      });

      test(
          'should return success as false on failure, an expection message and a null body',
          () async {
        when(jobsDatasource()).thenThrow(Exception('ERROR'));

        final result = await jobsUsecase('query');

        expect(result.success, false);
        expect(result.message, 'Exception: ERROR');
        expect(result.body, isNull);
      });
    },
  );
}
