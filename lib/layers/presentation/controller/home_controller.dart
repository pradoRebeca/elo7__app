import 'package:elo7_app/layers/domain/models/dto/job_dto.dart';
import 'package:elo7_app/layers/domain/usecases/jobs/jobs_usecase.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController(this._jobsUsecase);

  final JobsUsecase _jobsUsecase;

  var jobs = <String, List<JobDto>>{}.obs;

  @override
  void onInit() {
    super.onInit();
    searchJobs(null);
  }

  Future<void> searchJobs(String? query) async {
    var response = await _jobsUsecase(query);

    if (response.success) {
      jobs.value = response.body as Map<String, List<JobDto>>;
      return;
    }

    jobs.value = {};
  }
}
