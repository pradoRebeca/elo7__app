import 'package:elo7_app/layers/data/datasources/section_data_datasource.dart';
import 'package:elo7_app/layers/data/repositories/section_data_repository_impl.dart';
import 'package:elo7_app/layers/domain/models/entities/section_data_entity.dart';
import 'package:elo7_app/layers/domain/repositories/section_data_repositoy.dart';
import 'package:elo7_app/layers/domain/usecases/jobs/jobs_usecase.dart';
import 'package:elo7_app/layers/domain/usecases/section_data/section_data_usecase.dart';
import 'package:elo7_app/layers/domain/usecases/section_data/section_data_usecase_impl.dart';
import 'package:elo7_app/layers/presentation/components/divider.dart';
import 'package:elo7_app/layers/presentation/components/image_card.dart';
import 'package:elo7_app/layers/presentation/components/title_section.dart';
import 'package:elo7_app/layers/presentation/controller/home_controller.dart';
import 'package:elo7_app/layers/presentation/controller/home_controller_impl.dart';
import 'package:elo7_app/layers/presentation/sections/work_with_us.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'work_with_us_test.mocks.dart';

@GenerateNiceMocks(
  [MockSpec<JobsUsecase>(), MockSpec<SectionDataDatasource>()],
)
void main() {
  late MockSectionDataDatasource sectionDataDatasource;
  late SectionDataRepositoy sectionDataRepository;
  late SectionDataUsecase sectionDataUsecase;
  late HomeController controller;

  setUp(() {
    sectionDataDatasource = MockSectionDataDatasource();
    sectionDataRepository = SectionDataRepositoryImpl(sectionDataDatasource);
    sectionDataUsecase = SectionDataUsecaseImpl(sectionDataRepository);
    controller = HomeControllerImpl(MockJobsUsecase(), sectionDataUsecase);
  });

  group('Wokr With Us Section', () {
    Future<void> pumpWorkWithUs(WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: WorkWithUs(controller: controller),
            ),
          ),
        ),
      );
    }

    testWidgets('renders work with us widget correcty',
        (WidgetTester tester) async {
      final List<SectionDataEntity> dataSection = [
        SectionDataEntity(
          detail: 'Somos uma empresa...',
          link: 'https://link1.com',
          sectionType: SectionType.workWithUs,
        ),
      ];

      when(sectionDataDatasource()).thenReturn(dataSection);

      controller.getSectionData();

      await pumpWorkWithUs(tester);

      await tester.pumpAndSettle();

      expect(find.byType(ImageCard), findsNWidgets(1));
      expect(find.byType(TitleSection), findsNWidgets(1));
      expect(find.text('Somos uma empresa...'), findsNWidgets(1));
      expect(find.byType(CustomDivider), findsNWidgets(1));
    });

    testWidgets(
        "when detail is null, the default text should 'Venha fazer parte!'",
        (WidgetTester tester) async {
      final List<SectionDataEntity> dataSection = [
        SectionDataEntity(
          link: 'https://link1.com',
          sectionType: SectionType.workWithUs,
        ),
      ];

      when(sectionDataDatasource()).thenReturn(dataSection);

      controller.getSectionData();

      await pumpWorkWithUs(tester);

      await tester.pumpAndSettle();

      expect(find.text('Venha fazer parte!'), findsNWidgets(1));
    });

    testWidgets(
        "when detail is empty, the default text should 'Venha fazer parte!'",
        (WidgetTester tester) async {
      final List<SectionDataEntity> dataSection = [
        SectionDataEntity(
          detail: '',
          link: 'https://link1.com',
          sectionType: SectionType.workWithUs,
        ),
      ];

      when(sectionDataDatasource()).thenReturn(dataSection);

      controller.getSectionData();

      await pumpWorkWithUs(tester);

      await tester.pumpAndSettle();

      expect(find.text('Venha fazer parte!'), findsNWidgets(1));
    });
  });
}
