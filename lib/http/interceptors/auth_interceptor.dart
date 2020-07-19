import 'dart:async';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthInterceptor extends Interceptor{
  @override
  Future<dynamic> onRequest(RequestOptions options) async {
    if (options.headers.containsKey('requiresToken')) {
      options.headers.remove('requiresToken');

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token');

      options.headers.addAll({
        'Authorization': 'Bearer: $token'
      });
    }

    return options;
  }
}