import 'package:elo7_app/layers/data/datasources/jobs_datasource.dart';
import 'package:elo7_app/layers/data/datasources/section_data_datasource.dart';
import 'package:elo7_app/layers/data/repositories/jobs_repository_impl.dart';
import 'package:elo7_app/layers/data/repositories/section_data_repository_impl.dart';
import 'package:elo7_app/layers/domain/models/entities/section_data_entity.dart';
import 'package:elo7_app/layers/domain/repositories/jobs_repository.dart';
import 'package:elo7_app/layers/domain/repositories/section_data_repositoy.dart';
import 'package:elo7_app/layers/domain/usecases/jobs/jobs_usecase_impl.dart';
import 'package:elo7_app/layers/domain/usecases/section_data/section_data_usecase.dart';
import 'package:elo7_app/layers/domain/usecases/section_data/section_data_usecase_impl.dart';
import 'package:elo7_app/layers/external/static_data/sections_data.dart';
import 'package:elo7_app/layers/presentation/controller/home_controller_impl.dart';
import 'package:elo7_app/layers/shared/utils/job_formatter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:elo7_app/layers/domain/usecases/jobs/jobs_usecase.dart';

import '../../../mock/jobs_response_mock.dart';
import 'home_controller_test.mocks.dart';

@GenerateNiceMocks(
    [MockSpec<JobsDatasource>(), MockSpec<SectionDataDatasource>()])
void main() {
  late SectionDataDatasource sectionDataDatasource;
  late SectionDataRepositoy sectionDataRepository;
  late SectionDataUsecase sectionDataUsecase;
  late HomeControllerImpl homeController;

  late JobsDatasource jobsDatasource;
  late JobsRepository jobsRepository;
  late JobsUsecase jobsUsecase;

  setUp(() {
    sectionDataDatasource = MockSectionDataDatasource();
    sectionDataRepository = SectionDataRepositoryImpl(sectionDataDatasource);
    sectionDataUsecase = SectionDataUsecaseImpl(sectionDataRepository);

    jobsDatasource = MockJobsDatasource();
    jobsRepository = JobsRepositoryImpl(jobsDatasource);
    jobsUsecase = JobsUsecaseImpl(jobsRepository, JobFormatter());

    homeController = HomeControllerImpl(jobsUsecase, sectionDataUsecase);
  });

  group('HomeController - Jobs Tests', () {
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

  group('HomeController - Section Data Tests ', () {
    test('should initialize and call getSectionData', () {
      homeController.onInit();

      expect(homeController.workWithUsSection.value, isA<SectionDataEntity>());
      expect(homeController.meetOurTeamSection, isA<List<SectionDataEntity>>());
      expect(homeController.sellerStatementSection.value,
          isA<SectionDataEntity>());
      expect(homeController.highlightSection, isA<List<SectionDataEntity>>());
    });

    test('should load quantity section data correctly', () {
      when(sectionDataDatasource()).thenReturn(sectionDataEntityList);

      homeController.getSectionData();

      expect(homeController.meetOurTeamSection.length, 4);
      expect(homeController.highlightSection.length, 3);
    });
  });
}
