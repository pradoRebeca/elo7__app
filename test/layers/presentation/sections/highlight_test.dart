import 'package:elo7_app/layers/data/datasources/section_data_datasource.dart';
import 'package:elo7_app/layers/data/repositories/section_data_repository_impl.dart';
import 'package:elo7_app/layers/domain/models/entities/section_data_entity.dart';
import 'package:elo7_app/layers/domain/repositories/section_data_repositoy.dart';
import 'package:elo7_app/layers/domain/usecases/jobs/jobs_usecase.dart';
import 'package:elo7_app/layers/domain/usecases/section_data/section_data_usecase.dart';
import 'package:elo7_app/layers/domain/usecases/section_data/section_data_usecase_impl.dart';
import 'package:elo7_app/layers/presentation/components/highlight_image_card.dart';
import 'package:elo7_app/layers/presentation/controller/home_controller.dart';
import 'package:elo7_app/layers/presentation/controller/home_controller_impl.dart';
import 'package:elo7_app/layers/presentation/sections/highlight.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'highlight_test.mocks.dart';

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

  group('MeetOurTeam Section', () {
    Future<void> pumpHighlight(WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Highlight(controller: controller),
            ),
          ),
        ),
      );
    }

    testWidgets('renders HighlightImageCard correcty',
        (WidgetTester tester) async {
      final List<SectionDataEntity> dataSection = [
        SectionDataEntity(
          fileImageName: 'assets/images/image2.png',
          detail: 'Podemos...',
          title: 'Qualidade de vida',
          link: '',
          sectionType: SectionType.highlight,
        ),
        SectionDataEntity(
          fileImageName: 'assets/images/image2.png',
          detail: 'Nossa cultura...',
          title: 'Nossos valores',
          sectionType: SectionType.highlight,
        ),
      ];

      when(sectionDataDatasource()).thenReturn(dataSection);

      controller.getSectionData();

      await pumpHighlight(tester);

      await tester.pumpAndSettle();

      expect(find.byType(HighlightImageCard), findsNWidgets(2));
    });

    testWidgets('renders no HighlightImageCard when highlightSection is empty',
        (WidgetTester tester) async {
      final List<SectionDataEntity> dataSection = [];

      when(sectionDataDatasource()).thenReturn(dataSection);

      controller.getSectionData();

      await pumpHighlight(tester);

      await tester.pumpAndSettle();

      expect(find.byType(HighlightImageCard), findsNothing);
    });
  });
}
