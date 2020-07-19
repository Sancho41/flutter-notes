import 'package:dio/dio.dart';
import 'package:flutterNotes/http/interceptors/auth_interceptor.dart';
import 'package:flutterNotes/http/interceptors/logging_interceptor.dart';

const String baseUrl = bool.fromEnvironment('dart.vm.product')
    ? 'https://java-notes-sancho.herokuapp.com/api'
    : 'http://192.168.0.102:8000/api';

Dio createDio() {
  Dio dio = Dio(BaseOptions(
    connectTimeout: 5000,
    receiveTimeout: 5000,
    baseUrl: baseUrl,
  ));

  dio.interceptors.add(LoggingInterceptor());
  dio.interceptors.add(AuthInterceptor());
  return dio;
}