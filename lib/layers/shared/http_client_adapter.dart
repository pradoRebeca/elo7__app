import 'package:dio/dio.dart';

class HttpClientAdapter {
  HttpClientAdapter() {
    client.options.baseUrl = "https://img.elo7.com.br/";
  }

  final client = Dio();

  Future<Response> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
  }) async {
    return await client.get(path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress);
  }
}
