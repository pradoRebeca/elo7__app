import 'package:elo7_app/layers/domain/models/entities/section_data_entity.dart';
import 'package:elo7_app/layers/shared/response_presentation.dart';

abstract class SectionDataUsecase {
  ResponsePresentation call(SectionType sectionType);
}
