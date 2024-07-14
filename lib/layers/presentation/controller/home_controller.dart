import 'package:elo7_app/layers/domain/models/dto/job_dto.dart';
import 'package:elo7_app/layers/domain/usecases/jobs/jobs_usecase.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController(this._jobsUsecase);

  final JobsUsecase _jobsUsecase;

  var isloading = false.obs;
  var jobs = <String, List<JobDto>>{}.obs;

  @override
  void onInit() {
    super.onInit();
    searchJobs(null);
  }

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
