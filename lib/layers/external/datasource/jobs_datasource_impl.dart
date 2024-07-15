import 'package:elo7_app/layers/data/datasources/jobs_datasource.dart';
import 'package:elo7_app/layers/shared/http_client_adapter.dart';

class JobsDatasourceImpl implements JobsDatasource {
  JobsDatasourceImpl(this._client);

  final HttpCustomClientAdapter _client;

  @override
  Future<Map<String, dynamic>> call() async {
    final response = await _client.get('/mock-vagas.json');
    return response.data;
  }
}
