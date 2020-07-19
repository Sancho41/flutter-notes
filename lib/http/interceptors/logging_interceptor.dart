import 'package:dio/dio.dart';

class LoggingInterceptor{
  static RequestOptions interceptRequest({RequestOptions options}) {
    print('Request');
    print('url: ${options.uri}');
    print('headers: ${options.headers}');
    print('body: ${options.data}');
    return options;
  }

  static Response interceptResponse({Response options}) {
    print('Response');
    print('headers: ${options.headers}');
    print('body: ${options.data}');
    return options;
  }
}