import 'package:elo7_app/layers/data/datasources/section_data_datasource.dart';
import 'package:elo7_app/layers/data/repositories/section_data_repository_impl.dart';
import 'package:elo7_app/layers/domain/models/entities/section_data_entity.dart';
import 'package:elo7_app/layers/domain/repositories/section_data_repositoy.dart';
import 'package:elo7_app/layers/domain/usecases/jobs/jobs_usecase.dart';
import 'package:elo7_app/layers/domain/usecases/section_data/section_data_usecase.dart';
import 'package:elo7_app/layers/domain/usecases/section_data/section_data_usecase_impl.dart';
import 'package:elo7_app/layers/presentation/components/image_card.dart';
import 'package:elo7_app/layers/presentation/controller/home_controller.dart';
import 'package:elo7_app/layers/presentation/controller/home_controller_impl.dart';
import 'package:elo7_app/layers/presentation/sections/seller_statement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'seller_statement_test.mocks.dart';

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

  group('Seller Statement Section', () {
    Future<void> pumpSellerStatement(WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: SellerStatement(controller: controller),
            ),
          ),
        ),
      );
    }

    testWidgets('renders seller satatement correcty',
        (WidgetTester tester) async {
      final List<SectionDataEntity> dataSection = [
        SectionDataEntity(
          detail: 'Sou lojista...',
          title: 'Regina Bijoux',
          sectionType: SectionType.sellerStatement,
        ),
      ];

      when(sectionDataDatasource()).thenReturn(dataSection);

      controller.getSectionData();

      await pumpSellerStatement(tester);

      await tester.pumpAndSettle();

      expect(find.byType(Text), findsNWidgets(3));
      expect(find.byType(ImageCard), findsNWidgets(1));
    });

    testWidgets('detail is null, the Text should not be rendered',
        (WidgetTester tester) async {
      final List<SectionDataEntity> dataSection = [
        SectionDataEntity(
          title: 'Regina Bijoux',
          sectionType: SectionType.sellerStatement,
        ),
      ];

      when(sectionDataDatasource()).thenReturn(dataSection);

      controller.getSectionData();

      await pumpSellerStatement(tester);

      await tester.pumpAndSettle();

      expect(find.byType(Text), findsNWidgets(2));
    });

    testWidgets('detail is empty, the Text should not be rendered',
        (WidgetTester tester) async {
      final List<SectionDataEntity> dataSection = [
        SectionDataEntity(
          detail: '',
          title: 'Regina Bijoux',
          sectionType: SectionType.sellerStatement,
        ),
      ];

      when(sectionDataDatasource()).thenReturn(dataSection);

      controller.getSectionData();

      await pumpSellerStatement(tester);

      await tester.pumpAndSettle();

      expect(find.byType(Text), findsNWidgets(2));
    });

    testWidgets('title is empty, the Text should not be rendered',
        (WidgetTester tester) async {
      final List<SectionDataEntity> dataSection = [
        SectionDataEntity(
          title: '',
          detail: 'Sou lojista...',
          sectionType: SectionType.sellerStatement,
        ),
      ];

      when(sectionDataDatasource()).thenReturn(dataSection);

      controller.getSectionData();

      await pumpSellerStatement(tester);

      await tester.pumpAndSettle();

      expect(find.byType(Text), findsNWidgets(2));
    });

    testWidgets('title is null, the Text should not be rendered',
        (WidgetTester tester) async {
      final List<SectionDataEntity> dataSection = [
        SectionDataEntity(
          detail: 'Sou lojista...',
          sectionType: SectionType.sellerStatement,
        ),
      ];

      when(sectionDataDatasource()).thenReturn(dataSection);

      controller.getSectionData();

      await pumpSellerStatement(tester);

      await tester.pumpAndSettle();

      expect(find.byType(Text), findsNWidgets(2));
    });
  });
}
