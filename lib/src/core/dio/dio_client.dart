import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio_logs_manager/dio_logs_manager.dart';
import 'package:flutter/foundation.dart';
// ignore: depend_on_referenced_packages
import 'package:logging/logging.dart';
import 'package:weather_app/src/core/utils/env_config.dart';

//This is a wrong, never put your token in a way like this
const appid = '529c4b03d5badc1f4e6e1ae66b8403c1';

const String BASE_URL_DEV = 'http://api.openweathermap.org';
const String BASE_URL_PROD = 'http://api.openweathermap.org';

abstract class DioHttpClient {
  Dio get dio;
}

class DioHttpClientImpl implements DioHttpClient {
  DioHttpClientImpl(
    this._dio,
    this._environmentInfo,
  ) {
    _logger = Logger('*DIO-HTTP-CLIENT*');

    _configureDioClient(
      dio: _dio,
      baseUrl: _environmentInfo.apiBaseUrl,
    );

    _dio.options.queryParameters['appid'] = appid;
  }

  final Dio _dio;
  final EnvironmentInfo _environmentInfo;
  late Logger _logger;

  @override
  Dio get dio => _dio;

  void _configureDioClient({
    required Dio dio,
    required String baseUrl,
  }) {
    dio.options
      ..baseUrl = baseUrl
      ..connectTimeout = 50000 //50s
      ..receiveTimeout = 50000
      ..validateStatus = (int? status) {
        return status == 200;
      };

    //Ignore Certificate
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    //

    if (!kReleaseMode || baseUrl != BASE_URL_PROD) {
      dio.interceptors.add(
        LogInterceptor(
          logPrint: (log) {
            _logger.info(log);
          },
          requestBody: true,
          responseHeader: false,
          responseBody: true,
        ),
      ); //Open log;
      dio.interceptors.add(DioLogInterceptor());
    }
  }
}
