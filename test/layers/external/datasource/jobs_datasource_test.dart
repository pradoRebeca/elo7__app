import 'package:dio/dio.dart';
import 'package:elo7_app/layers/external/datasource/jobs_datasource_impl.dart';
import 'package:elo7_app/layers/shared/http_client_adapter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../mock/jobs_response_mock.dart';
import 'jobs_datasource_test.mocks.dart';

@GenerateNiceMocks([MockSpec<HttpCustomClientAdapter>()])
void main() {
  late JobsDatasourceImpl datasource;
  late HttpCustomClientAdapter mockHttpClientAdapter;

  setUp(() {
    mockHttpClientAdapter = MockHttpCustomClientAdapter();
    datasource = JobsDatasourceImpl(mockHttpClientAdapter);
  });

  group('JobsDatasourceImpl', () {
    test('should return data when the http call completes successfully',
        () async {
      when(mockHttpClientAdapter.get('/mock-vagas.json')).thenAnswer(
        (_) async => Response(
            data: jobsResponseApiMock, requestOptions: RequestOptions()),
      );

      final result = await datasource.call();

      expect(result, jobsResponseApiMock);
      verify(mockHttpClientAdapter.get('/mock-vagas.json')).called(1);
    });

    test('should throw an exception when the http call completes with an error',
        () async {
      when(mockHttpClientAdapter.get('/mock-vagas.json'))
          .thenThrow(Exception('Network error'));

      final call = datasource();

      expect(() => call, throwsA(isA<Exception>()));
      verify(mockHttpClientAdapter.get('/mock-vagas.json')).called(1);
    });
  });
}
