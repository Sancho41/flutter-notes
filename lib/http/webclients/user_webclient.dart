import 'dart:convert';

import 'package:flutterNotes/dtos/login_dto.dart';
import 'package:flutterNotes/dtos/register_user_dto.dart';
import 'package:flutterNotes/http/exceptions/http_exception.dart';
import 'package:flutterNotes/http/webclient.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserWebClient {
  static final Map<int, String> _statusCodeResponses = {
    401: 'Email or password incorrect',
    500: 'Server error',
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

  Future<void> login(LoginDTO loginDTO) async {
    final Response response = await post(
      '$baseUrl/login',
      headers: {
        'Content-type': 'application/json',
      },
      body: loginDTO.toJson(),
    );

    if (response.statusCode != 200)
      throw HttpException(_statusCodeResponses[response.statusCode]);

    await _saveToken(jsonDecode(response.body)['data']['token']);
  }

  Future<void> register(RegisterUserDTO registerUserDTO) async {
    final Response response = await post(
      '$baseUrl/register',
      headers: {
        'Content-type': 'application/json',
      },
      body: registerUserDTO.toJson()
    );

    print(response.statusCode);

    if (response.statusCode != 201)
      throw HttpException(_statusCodeResponses[response.statusCode]);
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('logged', false);
    await prefs.remove('token');
  }
}
