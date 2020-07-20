import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterNotes/components/response_dialog.dart';
import 'package:flutterNotes/dtos/login_dto.dart';
import 'package:flutterNotes/dtos/register_user_dto.dart';
import 'package:flutterNotes/http/exceptions/http_exception.dart';
import 'package:flutterNotes/http/webclients/user_webclient.dart';
import 'package:flutterNotes/models/user.dart';
import 'package:flutterNotes/screens/home.dart';
import 'package:flutterNotes/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  final UserWebClient _webClient = new UserWebClient();

  Future<void> login(BuildContext context, LoginDTO loginDTO) async {
    if (loginDTO.hasEmptyFields()) {
      await showDialog(
        context: context,
        builder: (contextDialog) => FailureDialog('Fill all fields!'),
      );
      return;
    }

    try {
      await this._webClient.login(loginDTO);
      Navigator.pushNamedAndRemoveUntil(
        context,
        Home.routeName,
        (route) => false,
      );
    } on HttpException catch (error) {
      await showDialog(
        context: context,
        builder: (contextDialog) => FailureDialog(error.message),
      );
    } catch (error) {
      await showDialog(
        context: context,
        builder: (contextDialog) => FailureDialog('Uknown error'),
      );
    }
  }

  Future<void> register(
    BuildContext context,
    RegisterUserDTO registerUserDTO,
  ) async {
    if (registerUserDTO.hasEmptyFields()) {
      await showDialog(
        context: context,
        builder: (contextDialog) => FailureDialog('Fill all fields!'),
      );
      return;
    }

    try {
      await this._webClient.register(registerUserDTO);
      await showDialog(
        context: context,
        builder: (contextDialog) =>
            SuccessDialog('User registered! You can now login!'),
      );
      Navigator.pushNamedAndRemoveUntil(
        context,
        Login.routeName,
        (route) => true,
      );
    } on HttpException catch (error) {
      await showDialog(
        context: context,
        builder: (contextDialog) => FailureDialog(error.message),
      );
    } catch (error) {
      await showDialog(
        context: context,
        builder: (contextDialog) => FailureDialog('Uknown error'),
      );
    }
  }

  Future<void> logout([BuildContext context]) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('user');
    if (context != null)
      Navigator.pushNamedAndRemoveUntil(
        context,
        Login.routeName,
        (route) => false,
      );
  }

  Future<User> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userJson = prefs.getString('user');
    if (userJson != null)
      return new User.fromJson(jsonDecode(userJson));
    return null;
  }
}
