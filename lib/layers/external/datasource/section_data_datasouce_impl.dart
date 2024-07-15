import 'package:elo7_app/layers/data/datasources/section_data_datasource.dart';
import 'package:elo7_app/layers/domain/models/entities/section_data_entity.dart';
import 'package:elo7_app/layers/external/static_data/sections_data.dart';

class SectionDataDatasouceImpl implements SectionDataDatasource {
  @override
  List<SectionDataEntity> call() {
    return sectionDataEntityList;
  }
}
