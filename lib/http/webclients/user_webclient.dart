import 'dart:convert';

import 'package:flutterNotes/http/exceptions/http_exception.dart';
import 'package:flutterNotes/http/interceptors/logging_interceptor.dart';
import 'package:flutterNotes/http/webclient.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserWebClient {
  static final Map<int, String> _statusCodeResponses = {
    400: 'There was an error submitting transaction',
    401: 'Email or password incorrect',
    409: 'Transaction already exists'
  };

  Future<void> _saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    await prefs.setBool('logged', true);
  }

  Future<String> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<bool> isLogged() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('logged') ?? false;
  }

  Future<void> login(String email, String password) async {
    Client client = HttpClientWithInterceptor.build(
      interceptors: [LoggingInterceptor()],
//      requestTimeout: Duration(seconds: 5),
    );

    final Response response = await client.post(
      '$baseUrl/login',
      headers: {
        'Content-type': 'application/json',
      },
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );

    if (response.statusCode != 200)
      throw HttpException(_statusCodeResponses[response.statusCode]);

    await _saveToken(jsonDecode(response.body)['data']['token']);
  }
  
  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('logged', false);
    await prefs.remove('token');
  }
}
