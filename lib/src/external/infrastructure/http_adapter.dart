import 'package:dio/dio.dart';

enum HttpMethod { get, post }

abstract class HttpAdapterInterface {
  Future<Response> request<T>({
    required HttpMethod method,
    required String path,
    dynamic data,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
  });
}

class HttpAdapter implements HttpAdapterInterface {
  final Dio _clientHttp;
  final bool showLog;
  final String baseUrl;
  final Map<String, dynamic>? baseHeaders;

  static const headers = {"Content-Type": "application/json"};

  HttpAdapter({
    required this.baseUrl,
    this.baseHeaders = headers,
    this.showLog = false,
  }) : _clientHttp = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            headers: baseHeaders,
          ),
        )..interceptors.addAll(
            showLog
                ? [
                    LogInterceptor(responseBody: true),
                  ]
                : [],
          );

  @override
  Future<Response> request<T>({
    required HttpMethod method,
    required String path,
    dynamic data,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
  }) async {
    try {
      String apiMethod = '';

      switch (method) {
        case HttpMethod.get:
          apiMethod = 'GET';
          break;
        case HttpMethod.post:
          apiMethod = 'POST';
          break;
        default:
      }

      final reponse = await _clientHttp.request(
        path,
        data: data,
        queryParameters: params,
        options: Options(
          method: apiMethod,
          headers: headers,
        ),
      );

      return reponse;
    } on Exception catch (error) {
      return Future.error(error);
    }
  }
}
