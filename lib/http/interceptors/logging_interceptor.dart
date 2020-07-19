import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LoggingInterceptor{
  static RequestOptions interceptRequest({RequestOptions options}) {
    debugPrint('Request');
    debugPrint('url: ${options.uri}');
    debugPrint('headers: ${options.headers}');
    debugPrint('body: ${options.data}');
    return options;
  }

  static Response interceptResponse({Response options}) {
    debugPrint('Response');
    debugPrint('headers: ${options.headers}');
    debugPrint('body: ${options.data}');
    return options;
  }
}