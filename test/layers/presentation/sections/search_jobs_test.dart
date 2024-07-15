import 'package:elo7_app/layers/data/datasources/jobs_datasource.dart';
import 'package:elo7_app/layers/data/repositories/jobs_repository_impl.dart';
import 'package:elo7_app/layers/domain/repositories/jobs_repository.dart';
import 'package:elo7_app/layers/domain/usecases/jobs/jobs_usecase.dart';
import 'package:elo7_app/layers/domain/usecases/jobs/jobs_usecase_impl.dart';
import 'package:elo7_app/layers/domain/usecases/section_data/section_data_usecase.dart';
import 'package:elo7_app/layers/presentation/components/jobs_by_type_card.dart';
import 'package:elo7_app/layers/presentation/components/loading.dart';
import 'package:elo7_app/layers/presentation/components/not_found_card.dart';
import 'package:elo7_app/layers/presentation/controller/home_controller.dart';
import 'package:elo7_app/layers/presentation/controller/home_controller_impl.dart';
import 'package:elo7_app/layers/presentation/sections/search_jobs.dart';
import 'package:elo7_app/layers/shared/utils/job_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../mock/jobs_response_mock.dart';
import 'search_jobs_test.mocks.dart';

@GenerateNiceMocks([MockSpec<JobsDatasource>(), MockSpec<SectionDataUsecase>()])
void main() {
  group('SearchJobs Widget', () {
    late final JobsDatasource jobsDatasource = MockJobsDatasource();
    final JobsRepository jobsRepository = JobsRepositoryImpl(jobsDatasource);
    final JobsUsecase jobsUsecase =
        JobsUsecaseImpl(jobsRepository, JobFormatter());
    final HomeController controller =
        HomeControllerImpl(jobsUsecase, MockSectionDataUsecase());

    Future<void> pumpSearchJobSection(WidgetTester tester) async {
      await tester.pumpWidget(
        GetMaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: SearchJobs(controller: controller),
            ),
          ),
        ),
      );
    }

    testWidgets('Widget displays loading indicator', (tester) async {
      controller.isloading.value = true;

      await pumpSearchJobSection(tester);

      expect(find.byType(Loading), findsOneWidget);
    });

    testWidgets('Widget displays jobs list', (tester) async {
      when(jobsDatasource()).thenAnswer((_) async => jobsResponseApiMock);

      await controller.searchJobs(null);

      await pumpSearchJobSection(tester);

      expect(find.byType(JobsByTypeCard), findsNWidgets(3));
    });

    testWidgets('Widget displays not found message', (tester) async {
      when(jobsDatasource()).thenAnswer((_) async => jobsResponseApiMock);

      await controller.searchJobs('query');

      await pumpSearchJobSection(tester);

      expect(find.byType(NotFoundCard), findsOneWidget);
    });
  });
}
