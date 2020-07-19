import 'package:dio/dio.dart';
import 'package:flutterNotes/dtos/login_dto.dart';
import 'package:flutterNotes/dtos/register_user_dto.dart';
import 'package:flutterNotes/http/exceptions/http_exception.dart';
import 'package:flutterNotes/http/webclient.dart';

import 'package:shared_preferences/shared_preferences.dart';

class UserWebClient {
  static final Map<int, String> _statusCodeResponses = {
    401: 'Email or password incorrect',
    400: 'Password did not match',
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
    Dio dio = createDio();

    try {
      final Response response =
          await dio.post('/login', data: loginDTO.toJson());
      await _saveToken(response.data['data']['token']);
    } on DioError catch (e) {
      throw HttpException(_statusCodeResponses[e.response.statusCode]);
    }
  }

  Future<void> register(RegisterUserDTO registerUserDTO) async {
    Dio dio = createDio();

    try {
      await dio.post(
        '/register',
        data: registerUserDTO.toJson(),
      );
    } on DioError catch (e) {
      throw HttpException(_statusCodeResponses[e.response.statusCode]);
    }
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('logged', false);
    await prefs.remove('token');
  }
}
