import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:some_lessons_from_youtube/network/api_contract.dart';

class ApiProvider {

  Logger logger = Logger();

  static const String TAG = "ApiProvider";
  Dio? _dio;

  static final ApiProvider _instance = ApiProvider._internal();

  ApiProvider._internal() {
    setupClient();
  }

  factory ApiProvider() {
    return _instance;
  }

  void setupClient() {
    _setupDio();
  }

  Future<Response>? get(String url) {
    try {
      logger.d("GET request:  URL: $url");
      return _dio?.get(
          url,
          options: Options(
              followRedirects: false,
              validateStatus: (status) {
                return status! < 500;
              }
          )
      );
    } catch(_) {
      return null;
    }
  }

  Future<Response>? post(String url, dynamic dataDynamic) {
    try {
      logger.d("POST request:  URL: $url");
      return _dio?.post(
          url,
          data: dataDynamic,
          options: Options(
              followRedirects: false,
              validateStatus: (status) {
                return status! < 500;
              }
          )
      );
    } catch(_) {
      return null;
    }
  }

  Future<Response>? put(String url, dynamic dataDynamic) {
    try {
      logger.d("PUT request:  URL: $url");
      return _dio?.put(
          url,
          data: dataDynamic,
          options: Options(
              followRedirects: false,
              validateStatus: (status) {
                return status! < 500;
              }
          )
      );
    } catch(_) {
      return null;
    }
  }

  void _setupDio() {
    _dio = Dio(getBaseOptions());
  }

  BaseOptions getBaseOptions() {
    return BaseOptions()
      ..baseUrl = ApiContract.baseUrl;
  }
}