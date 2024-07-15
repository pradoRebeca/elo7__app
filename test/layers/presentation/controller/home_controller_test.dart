import 'package:elo7_app/layers/data/datasources/jobs_datasource.dart';
import 'package:elo7_app/layers/data/repositories/jobs_repository_impl.dart';
import 'package:elo7_app/layers/domain/repositories/jobs_repository.dart';
import 'package:elo7_app/layers/domain/usecases/jobs/jobs_usecase_impl.dart';
import 'package:elo7_app/layers/domain/usecases/section_data/section_data_usecase.dart';
import 'package:elo7_app/layers/presentation/controller/home_controller_impl.dart';
import 'package:elo7_app/layers/shared/utils/job_formatter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:elo7_app/layers/domain/usecases/jobs/jobs_usecase.dart';

import '../../../mock/jobs_response_mock.dart';
import 'home_controller_test.mocks.dart';

@GenerateNiceMocks([MockSpec<JobsDatasource>(), MockSpec<SectionDataUsecase>()])
void main() {
  late final JobsDatasource jobsDatasource = MockJobsDatasource();
  final JobsRepository jobsRepository = JobsRepositoryImpl(jobsDatasource);
  final JobsUsecase jobsUsecase =
      JobsUsecaseImpl(jobsRepository, JobFormatter());
  final HomeControllerImpl homeController =
      HomeControllerImpl(jobsUsecase, MockSectionDataUsecase());

  group('HomeController', () {
    test('should call JobsUsecase onInit', () async {
      homeController.onInit();

      await untilCalled(jobsDatasource());
      verify(jobsDatasource()).called(1);
    });
    test('should update isLoading and jobs on successful search', () async {
      when(jobsDatasource()).thenAnswer((_) async => jobsResponseApiMock);

      await homeController.searchJobs('senior');

      expect(homeController.isloading.value, false);
      expect(homeController.jobs.length, 1);
    });

    test('should clear jobs on unsuccessful search', () async {
      when(jobsDatasource()).thenAnswer((_) async => jobsResponseApiMock);

      await homeController.searchJobs('query');

      expect(homeController.isloading.value, false);
      expect(homeController.jobs.isEmpty, true);
    });

    test('should initialize with empty jobs and isLoading false', () {
      expect(homeController.isloading.value, false);
      expect(homeController.jobs.isEmpty, true);
    });
  });
}
