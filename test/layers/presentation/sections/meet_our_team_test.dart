import 'package:elo7_app/layers/data/datasources/section_data_datasource.dart';
import 'package:elo7_app/layers/data/repositories/section_data_repository_impl.dart';
import 'package:elo7_app/layers/domain/models/entities/section_data_entity.dart';
import 'package:elo7_app/layers/domain/repositories/section_data_repositoy.dart';
import 'package:elo7_app/layers/domain/usecases/jobs/jobs_usecase.dart';
import 'package:elo7_app/layers/domain/usecases/section_data/section_data_usecase.dart';
import 'package:elo7_app/layers/domain/usecases/section_data/section_data_usecase_impl.dart';
import 'package:elo7_app/layers/presentation/controller/home_controller_impl.dart';
import 'package:elo7_app/layers/presentation/sections/meet_our_team.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:elo7_app/layers/presentation/components/image_card.dart';
import 'package:elo7_app/layers/presentation/controller/home_controller.dart';
import 'package:mockito/mockito.dart';

import 'meet_our_team_test.mocks.dart';

@GenerateNiceMocks([MockSpec<JobsUsecase>(), MockSpec<SectionDataDatasource>()])
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
    Future<void> pumpMeetOurTeam(WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: MeetOurTeam(controller: controller),
            ),
          ),
        ),
      );
    }

    testWidgets('renders title and team images', (WidgetTester tester) async {
      final List<SectionDataEntity> meetOurTeamSection = [
        SectionDataEntity(
          fileImageName: 'assets/images/image1.png',
          sectionType: SectionType.meetOurTeam,
        ),
        SectionDataEntity(
          fileImageName: 'assets/images/image2.png',
          sectionType: SectionType.meetOurTeam,
        ),
      ];

      when(sectionDataDatasource()).thenReturn(meetOurTeamSection);

      controller.getSectionData();

      await pumpMeetOurTeam(tester);

      await tester.pumpAndSettle();

      expect(find.text('Conheça nosso time fora de série'), findsOneWidget);
      expect(find.byType(ImageCard), findsNWidgets(2));
    });

    testWidgets('renders no image if controller meetOuTeamSection is empty',
        (WidgetTester tester) async {
      final List<SectionDataEntity> meetOurTeamSection = [];

      when(sectionDataDatasource()).thenReturn(meetOurTeamSection);

      controller.getSectionData();

      await pumpMeetOurTeam(tester);

      await tester.pumpAndSettle();

      expect(find.text('Conheça nosso time fora de série'), findsOneWidget);
      expect(find.byType(ImageCard), findsNothing);
    });

    testWidgets('renders no image if fileImageName is null',
        (WidgetTester tester) async {
      final List<SectionDataEntity> meetOurTeamSection = [
        SectionDataEntity(
          sectionType: SectionType.meetOurTeam,
        ),
      ];

      when(sectionDataDatasource()).thenReturn(meetOurTeamSection);

      controller.getSectionData();

      await pumpMeetOurTeam(tester);

      await tester.pumpAndSettle();

      expect(find.text('Conheça nosso time fora de série'), findsOneWidget);
      expect(find.byType(ImageCard), findsNothing);
    });

    testWidgets('renders no image if fileImageName is null',
        (WidgetTester tester) async {
      final List<SectionDataEntity> meetOurTeamSection = [
        SectionDataEntity(
          fileImageName: '',
          sectionType: SectionType.meetOurTeam,
        ),
      ];

      when(sectionDataDatasource()).thenReturn(meetOurTeamSection);

      controller.getSectionData();

      await pumpMeetOurTeam(tester);

      await tester.pumpAndSettle();

      expect(find.text('Conheça nosso time fora de série'), findsOneWidget);
      expect(find.byType(ImageCard), findsNothing);
    });
  });
}
