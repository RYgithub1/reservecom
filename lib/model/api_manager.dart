import 'package:dio/dio.dart';
import 'environment.dart';

class ApiManager {
  final _connectTimeout = 10000;
  final _receiveTimeout = 10000;

  Dio dio;

  ApiManager() {
    BaseOptions options = BaseOptions(
      baseUrl: Environment.baseUrl,
      connectTimeout: _connectTimeout,
      receiveTimeout: _receiveTimeout,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
    );

    dio = Dio(options);
  }
}
