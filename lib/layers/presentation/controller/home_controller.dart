import 'package:elo7_app/layers/domain/models/dto/job_dto.dart';
import 'package:elo7_app/layers/domain/models/entities/section_data_entity.dart';
import 'package:get/get.dart';

abstract class HomeController {
  void getSectionData();
  Future<void> searchJobs(String? query);

  RxBool get isloading;
  RxMap<String, List<JobDto>> get jobs;
  Rx<SectionDataEntity> get workWithUsSection;
  RxList<SectionDataEntity> get highlightSection;
  RxList<SectionDataEntity> get meetOurTeamSection;
  Rx<SectionDataEntity> get sellerStatementSection;
}
