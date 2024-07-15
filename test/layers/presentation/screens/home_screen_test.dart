import 'package:elo7_app/layers/data/datasources/jobs_datasource.dart';
import 'package:elo7_app/layers/data/datasources/section_data_datasource.dart';
import 'package:elo7_app/layers/data/repositories/jobs_repository_impl.dart';
import 'package:elo7_app/layers/data/repositories/section_data_repository_impl.dart';
import 'package:elo7_app/layers/domain/repositories/jobs_repository.dart';
import 'package:elo7_app/layers/domain/repositories/section_data_repositoy.dart';
import 'package:elo7_app/layers/domain/usecases/jobs/jobs_usecase.dart';
import 'package:elo7_app/layers/domain/usecases/jobs/jobs_usecase_impl.dart';
import 'package:elo7_app/layers/domain/usecases/section_data/section_data_usecase.dart';
import 'package:elo7_app/layers/domain/usecases/section_data/section_data_usecase_impl.dart';
import 'package:elo7_app/layers/external/static_data/sections_data.dart';
import 'package:elo7_app/layers/presentation/controller/home_controller.dart';
import 'package:elo7_app/layers/presentation/controller/home_controller_impl.dart';
import 'package:elo7_app/layers/presentation/screens/home_screen.dart';
import 'package:elo7_app/layers/presentation/sections/highlight.dart';
import 'package:elo7_app/layers/presentation/sections/meet_our_team.dart';
import 'package:elo7_app/layers/presentation/sections/search_jobs.dart';
import 'package:elo7_app/layers/presentation/sections/seller_statement.dart';
import 'package:elo7_app/layers/presentation/sections/work_with_us.dart';
import 'package:elo7_app/layers/shared/utils/job_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../mock/jobs_response_mock.dart';
import 'home_screen_test.mocks.dart';

@GenerateNiceMocks(
  [
    MockSpec<JobsDatasource>(),
    MockSpec<SectionDataDatasource>(),
    MockSpec<JobFormatter>()
  ],
)
void main() {
  late MockSectionDataDatasource sectionDataDatasource;
  late SectionDataRepositoy sectionDataRepository;
  late SectionDataUsecase sectionDataUsecase;
  late HomeController controller;

  late JobsDatasource jobsDatasource;
  late JobsRepository jobsRepository;
  late JobsUsecase jobsUsecase;

  setUp(() {
    sectionDataDatasource = MockSectionDataDatasource();
    sectionDataRepository = SectionDataRepositoryImpl(sectionDataDatasource);
    sectionDataUsecase = SectionDataUsecaseImpl(sectionDataRepository);

    jobsDatasource = MockJobsDatasource();
    jobsRepository = JobsRepositoryImpl(jobsDatasource);
    jobsUsecase = JobsUsecaseImpl(jobsRepository, MockJobFormatter());

    controller = HomeControllerImpl(jobsUsecase, sectionDataUsecase);

    Get.put<HomeController>(controller);
  });

  group('Home Screen', () {
    Future<void> pumpWorkWithUs(WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: HomeScreen(),
        ),
      );
    }

    testWidgets('renders home screen widget correcty',
        (WidgetTester tester) async {
      when(jobsDatasource()).thenAnswer((_) async => jobsResponseApiMock);
      when(sectionDataDatasource()).thenReturn(sectionDataEntityList);

      await pumpWorkWithUs(tester);

      await tester.pump();

      expect(find.byType(WorkWithUs), findsNWidgets(1));
      expect(find.byType(SellerStatement), findsNWidgets(1));
      expect(find.byType(MeetOurTeam), findsNWidgets(1));
      expect(find.byType(Highlight), findsNWidgets(1));
      expect(find.byType(SearchJobs), findsNWidgets(1));
      expect(find.byType(SingleChildScrollView), findsNWidgets(1));
    });
  });
}
