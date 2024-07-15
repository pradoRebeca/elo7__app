import 'package:elo7_app/layers/domain/models/dto/job_dto.dart';
import 'package:elo7_app/layers/domain/models/entities/section_data_entity.dart';
import 'package:elo7_app/layers/domain/usecases/jobs/jobs_usecase.dart';
import 'package:elo7_app/layers/domain/usecases/section_data/section_data_usecase.dart';
import 'package:elo7_app/layers/presentation/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeControllerImpl extends GetxController implements HomeController {
  HomeControllerImpl(this._jobsUsecase, this._sectionDataUsecase);

  final JobsUsecase _jobsUsecase;
  final SectionDataUsecase _sectionDataUsecase;

  @override
  var isloading = false.obs;

  @override
  var jobs = <String, List<JobDto>>{}.obs;

  @override
  var workWithUsSection =
      SectionDataEntity(sectionType: SectionType.workWithUs).obs;

  @override
  var highlightSection = <SectionDataEntity>[].obs;
  @override
  var meetOurTeamSection = <SectionDataEntity>[].obs;

  @override
  var sellerStatementSection =
      SectionDataEntity(sectionType: SectionType.sellerStatement).obs;

  @override
  void onInit() {
    super.onInit();
    getSectionData();
    searchJobs(null);
  }

  @override
  void getSectionData() {
    var workWithUsSectionResponse = _sectionDataUsecase(SectionType.workWithUs);
    workWithUsSection.value =
        (workWithUsSectionResponse.body as List<SectionDataEntity>).first;

    var meetOurTeamSectionResponse =
        _sectionDataUsecase(SectionType.meetOurTeam);
    meetOurTeamSection
        .assignAll(meetOurTeamSectionResponse.body as List<SectionDataEntity>);

    var sellerStatementSectionResponse =
        _sectionDataUsecase(SectionType.sellerStatement);
    sellerStatementSection.value =
        (sellerStatementSectionResponse.body as List<SectionDataEntity>).first;

    var highlightSectionResponse = _sectionDataUsecase(SectionType.highlight);
    highlightSection
        .assignAll(highlightSectionResponse.body as List<SectionDataEntity>);
  }

  @override
  Future<void> searchJobs(String? query) async {
    isloading.value = true;

    var response = await _jobsUsecase(query);

    if (response.success) {
      jobs.assignAll(response.body as Map<String, List<JobDto>>);
    }

    if (!response.success) {
      jobs.value = {};
    }

    isloading.value = false;
  }
}
