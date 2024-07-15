import 'package:elo7_app/layers/data/datasources/section_data_datasource.dart';
import 'package:elo7_app/layers/domain/models/entities/section_data_entity.dart';
import 'package:elo7_app/layers/domain/repositories/section_data_repositoy.dart';

class SectionDataRepositoryImpl implements SectionDataRepositoy {
  SectionDataRepositoryImpl(this._sectionDataDatasource);

  final SectionDataDatasource _sectionDataDatasource;

  @override
  List<SectionDataEntity> call() {
    return _sectionDataDatasource();
  }
}
