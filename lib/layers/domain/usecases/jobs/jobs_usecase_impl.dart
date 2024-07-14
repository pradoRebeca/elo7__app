import 'package:elo7_app/layers/domain/models/dto/job_dto.dart';
import 'package:elo7_app/layers/domain/repositories/jobs_repository.dart';
import 'package:elo7_app/layers/domain/usecases/jobs/jobs_usecase.dart';
import 'package:elo7_app/layers/shared/response_presentation.dart';
import 'package:elo7_app/layers/shared/utils/job_formatter.dart';

class JobsUsecaseImpl implements JobsUsecase {
  JobsUsecaseImpl(this._jobsRepository, this._jobFormatter);

  final JobsRepository _jobsRepository;
  final JobFormatter _jobFormatter;

  @override
  Future<ResponsePresentation> call(String? query) async {
    try {
      var data = await _jobsRepository();

      final formatJobs = _jobFormatter.formatJobs(data);

      List<JobDto> resultJobs = [];

      if (query != null && query.isNotEmpty) {
        resultJobs = _jobFormatter.filterJobsByQuery(formatJobs, query);
      } else {
        resultJobs = formatJobs.take(3).toList();
      }

      final separatedJobs = _jobFormatter.separateJobsByType(resultJobs);

      return ResponsePresentation(success: true, body: separatedJobs);
    } catch (error) {
      return ResponsePresentation(success: false, message: error.toString());
    }
  }
}
