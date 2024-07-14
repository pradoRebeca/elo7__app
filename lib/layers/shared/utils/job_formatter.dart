import 'package:elo7_app/layers/domain/models/dto/job_dto.dart';

class JobFormatter {
  List<JobDto> formatJobs(List<JobDto> jobs) {
    return jobs
        .where((job) => job.isActive)
        .map((job) => JobDto(
              title: _capitalizeEachWord(job.title),
              type: _capitalizeEachWord(job.type),
              level: _capitalizeEachWord(job.level),
              location: job.location != null
                  ? _capitalizeEachWord(job.location!)
                  : 'Remoto',
              isActive: job.isActive,
            ))
        .toList();
  }

  List<JobDto> filterJobsByQuery(List<JobDto> jobs, String query) {
    return jobs.where((job) {
      final formattedQuery = query.toLowerCase();
      return job.title.toLowerCase().contains(formattedQuery) ||
          job.type.toLowerCase().contains(formattedQuery) ||
          job.level.toLowerCase().contains(formattedQuery) ||
          (job.location?.toLowerCase().contains(formattedQuery) ?? false);
    }).toList();
  }

  Map<String, List<JobDto>> separateJobsByType(List<JobDto> jobs) {
    final Map<String, List<JobDto>> separatedJobs = {};

    for (var job in jobs) {
      if (separatedJobs[job.type] == null) {
        separatedJobs[job.type] = [];
      }
      separatedJobs[job.type]!.add(job);
    }

    return separatedJobs;
  }

  String _capitalizeEachWord(String text) {
    return text.split(' ').map((word) {
      if (word.isEmpty) return '';
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join(' ');
  }
}
