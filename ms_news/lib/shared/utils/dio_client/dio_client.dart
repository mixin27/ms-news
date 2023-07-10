import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'package:ms_news/shared/shared.dart';

class DioClient {
  static DioClient? _instance;

  static late Dio _dio;

  DioClient._({String? baseUrl}) {
    _dio = createDioClient(baseUrl);
  }

  factory DioClient({String? baseUrl}) =>
      _instance ?? DioClient._(baseUrl: baseUrl);
  Dio get instance => _dio;

  Dio createDioClient(String? baseUrl) {
    final dio = Dio();

    dio.options = BaseOptions(
      baseUrl: baseUrl ?? DotEnvUtils.prodBaseUrl,
      receiveTimeout: const Duration(seconds: 60),
      connectTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
      headers: {
        Headers.acceptHeader: 'application/json',
        Headers.contentTypeHeader: 'application/json',
      },
    );

    dio.interceptors.addAll([
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
      AppInterceptor(),
    ]);

    return dio;
  }
}
