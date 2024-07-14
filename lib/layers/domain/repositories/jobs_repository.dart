import 'package:elo7_app/layers/domain/models/dto/job_dto.dart';

abstract class JobsRepository {
  Future<List<JobDto>> call();
}
