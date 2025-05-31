import 'package:dio/dio.dart';

class BaseApiService {
  final Dio _dio;

  BaseApiService() : _dio = Dio() {
    _dio.options.headers = {'Accept': 'application/json'};
    // Add interceptors for token handling, logging, etc.
  }

  Dio get dio => _dio;
}
