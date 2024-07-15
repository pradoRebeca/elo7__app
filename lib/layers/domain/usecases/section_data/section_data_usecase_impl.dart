import 'package:elo7_app/layers/domain/models/entities/section_data_entity.dart';
import 'package:elo7_app/layers/domain/repositories/section_data_repositoy.dart';
import 'package:elo7_app/layers/domain/usecases/section_data/section_data_usecase.dart';
import 'package:elo7_app/layers/shared/response_presentation.dart';

class SectionDataUsecaseImpl implements SectionDataUsecase {
  final SectionDataRepositoy _sectionDataRepositoy;

  SectionDataUsecaseImpl(this._sectionDataRepositoy);

  @override
  ResponsePresentation call(SectionType sectionType) {
    List<SectionDataEntity> response = _sectionDataRepositoy();

    List<SectionDataEntity> filteredSections = response
        .where((section) => section.sectionType == sectionType)
        .toList();

    return ResponsePresentation(success: true, body: filteredSections);
  }
}
