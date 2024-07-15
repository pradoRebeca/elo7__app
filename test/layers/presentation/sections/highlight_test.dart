import 'package:elo7_app/layers/data/datasources/section_data_datasource.dart';
import 'package:elo7_app/layers/data/repositories/section_data_repository_impl.dart';
import 'package:elo7_app/layers/domain/repositories/section_data_repositoy.dart';
import 'package:elo7_app/layers/domain/usecases/jobs/jobs_usecase.dart';
import 'package:elo7_app/layers/domain/usecases/section_data/section_data_usecase.dart';
import 'package:elo7_app/layers/domain/usecases/section_data/section_data_usecase_impl.dart';
import 'package:elo7_app/layers/external/datasource/section_data_datasouce_impl.dart';
import 'package:elo7_app/layers/presentation/controller/home_controller_impl.dart';
import 'package:elo7_app/layers/presentation/sections/highlight.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elo7_app/layers/presentation/components/highlight_image_card.dart';
import 'package:elo7_app/layers/presentation/controller/home_controller.dart';
import 'package:mockito/annotations.dart';

import 'highlight_test.mocks.dart';

@GenerateNiceMocks([MockSpec<JobsUsecase>()])
void main() {
  final SectionDataDatasource sectionDataDatasource =
      SectionDataDatasouceImpl();
  final SectionDataRepositoy sectionDataRepositoy =
      SectionDataRepositoryImpl(sectionDataDatasource);
  final SectionDataUsecase sectionDataUsecase =
      SectionDataUsecaseImpl(sectionDataRepositoy);
  final HomeController homeController =
      HomeControllerImpl(MockJobsUsecase(), sectionDataUsecase);

  group('Highlight Widget Tests', () {
    Future<void> pumpHighlight(WidgetTester tester) async {
      return await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Highlight(controller: homeController),
        ),
      ));
    }

    testWidgets('displays HighlightImageCard when highlightSection has data',
        (WidgetTester tester) async {
      homeController.getSectionData();

      var firstDataHighlightSection = homeController.highlightSection.first;

      await pumpHighlight(tester);
      await tester.pumpAndSettle();

      expect(find.byType(HighlightImageCard), findsNWidgets(3));
      expect(find.text(firstDataHighlightSection.title!), findsOneWidget);
      expect(find.text(firstDataHighlightSection.detail!), findsOneWidget);
    });

    testWidgets('displays no HighlightImageCard when highlightSection is empty',
        (WidgetTester tester) async {
      homeController.highlightSection.value = [];

      homeController.getSectionData();

      await pumpHighlight(tester);
      await tester.pump();

      expect(find.byType(HighlightImageCard), findsNothing);
    });
  });
}
