import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LoggingInterceptor extends Interceptor{

  @override
  Future<dynamic> onRequest(RequestOptions options) async {
    debugPrint('->Request');
    debugPrint('->url: ${options.uri}');
    debugPrint('->headers: ${options.headers}');
    debugPrint('->body: ${options.data}');
    return options;
  }

  @override
  Future<dynamic> onError(DioError err) async{
    debugPrint('<-Error');
    debugPrint('<-message: ${err.message}');
    debugPrint('<-body: ${err.response.data}');
    debugPrint('<-statusCode: ${err.response.statusCode}');
    return err;
  }

  @override
  Future<dynamic> onResponse(Response response) async {
    debugPrint('<-Response');
    debugPrint('<-headers: ${response.headers}');
    debugPrint('<-body: ${response.data}');
    debugPrint('<-statusCode: ${response.statusCode}');
    return response;
  }
}