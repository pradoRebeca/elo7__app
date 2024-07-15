import 'package:elo7_app/layers/domain/models/entities/section_data_entity.dart';

abstract class SectionDataDatasource {
  List<SectionDataEntity> call();
}
