import 'package:elo7_app/layers/domain/usecases/section_data/section_data_usecase_impl.dart';
import 'package:elo7_app/layers/external/datasource/section_data_datasouce_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elo7_app/layers/domain/models/entities/section_data_entity.dart';
import 'package:elo7_app/layers/domain/repositories/section_data_repositoy.dart';
import 'package:elo7_app/layers/domain/usecases/section_data/section_data_usecase.dart';
import 'package:elo7_app/layers/shared/response_presentation.dart';
import 'package:elo7_app/layers/data/datasources/section_data_datasource.dart';
import 'package:elo7_app/layers/data/repositories/section_data_repository_impl.dart';
import 'package:elo7_app/layers/external/static_data/sections_data.dart';

void main() {
  group('SectionDataUsecaseImpl', () {
    late SectionDataDatasource datasource;
    late SectionDataUsecase usecase;
    late SectionDataRepositoy repository;

    setUp(() {
      datasource = SectionDataDatasouceImpl();
      repository = SectionDataRepositoryImpl(datasource);
      usecase = SectionDataUsecaseImpl(repository);
    });

    test('should return filtered section data based on section type', () {
      const sectionType = SectionType.meetOurTeam;

      final result = usecase(sectionType);

      expect(result, isA<ResponsePresentation>());
      expect(result.success, true);

      final filteredSections = sectionDataEntityList
          .where((section) => section.sectionType == sectionType)
          .toList();

      expect(result.body, filteredSections);
    });
  });
}
