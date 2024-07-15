import 'package:elo7_app/layers/external/datasource/section_data_datasouce_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elo7_app/layers/data/datasources/section_data_datasource.dart';
import 'package:elo7_app/layers/domain/models/entities/section_data_entity.dart';
import 'package:elo7_app/layers/external/static_data/sections_data.dart';

void main() {
  group('SectionDataDatasouceImpl', () {
    test('should return section data from static data', () {
      final SectionDataDatasource datasource = SectionDataDatasouceImpl();

      final result = datasource();

      expect(result, isA<List<SectionDataEntity>>());
      expect(result.length, sectionDataEntityList.length);

      for (int i = 0; i < result.length; i++) {
        expect(result[i].detail, sectionDataEntityList[i].detail);
      }
    });

    test('should return empty list when static data is empty', () {
      SectionDataDatasouceImpl emptyDatasource = SectionDataDatasouceImpl();

      sectionDataEntityList.clear();

      final result = emptyDatasource();

      expect(result, isEmpty);
    });
  });
}
