import 'package:dio/dio.dart';
import 'package:flutterNotes/dtos/login_dto.dart';
import 'package:flutterNotes/dtos/register_user_dto.dart';
import 'package:flutterNotes/exceptions/unauthenticated_exception.dart';
import 'package:flutterNotes/http/exceptions/http_exception.dart';
import 'package:flutterNotes/http/webclient.dart';
import 'package:flutterNotes/models/user.dart';

import 'package:shared_preferences/shared_preferences.dart';

class UserWebClient {
  static final Map<int, String> _statusCodeResponses = {
    401: 'Email or password incorrect',
    400: 'Password did not match',
    500: 'Server error',
  };

  Future<void> login(LoginDTO loginDTO) async {
    Dio dio = createDio();

    try {
      final Response response =
          await dio.post('/login', data: loginDTO.toJson());
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', response.data['data']['token']);

      // Get user after authentication
      await this.user();

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

  Options authOptions() {
    return Options(headers: {'requirestoken': true});
  }

  // ignore: missing_return
  Future<User> user() async {
    Dio dio = createDio();

    try {
      Response response = await dio.get(
        '/user',
        options: authOptions(),
      );

      User user =  User.fromJson(response.data['data']);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('user', user.toJson());
    } on DioError catch (e) {
      if (e.response.statusCode == 401)
        throw new UnauthenticatedException();
    }
  }
}
