import 'package:elo7_app/layers/data/datasources/jobs_datasource.dart';
import 'package:elo7_app/layers/domain/models/dto/job_dto.dart';
import 'package:elo7_app/layers/domain/repositories/jobs_repository.dart';

class JobsRepositoryImpl implements JobsRepository {
  JobsRepositoryImpl(this._jobsDatasource);

  final JobsDatasource _jobsDatasource;

  @override
  Future<List<JobDto>> call() async {
    try {
      var response = await _jobsDatasource();

      final List<dynamic> data = response['jobs'];

      return data.map((job) => JobDto.fromMap(job)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
