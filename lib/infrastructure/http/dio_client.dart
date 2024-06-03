import 'package:dio/dio.dart';
import 'package:login_app/infrastructure/http/response_interceptor.dart';

import 'token_manager.dart';

class DioClient {
  final Dio _dio;

  DioClient(BaseOptions options) : _dio = Dio(options) {
    final tokenManager = TokenManager();
    _dio.interceptors.add(ResponseInterceptor(tokenManager));
  }

  Dio get client => _dio;

  void setHeaders(Map<String, String> headers) {
    _dio.options.headers.addAll(headers);
  }

  void setBaseUrl(String baseUrl) {
    _dio.options.baseUrl = baseUrl;
  }
}
