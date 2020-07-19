import 'package:flutter/material.dart';
import 'package:flutterNotes/components/response_dialog.dart';
import 'package:flutterNotes/dtos/register_user_dto.dart';
import 'package:flutterNotes/http/exceptions/http_exception.dart';
import 'package:flutterNotes/http/webclients/user_webclient.dart';
import 'package:flutterNotes/screens/home.dart';
import 'package:flutterNotes/screens/login.dart';

class UserService {
  final UserWebClient _webClient = new UserWebClient();

  Future<void> login(
    BuildContext context,
    String email,
    String password,
  ) async {
    if (email.isEmpty || password.isEmpty) {
      await showDialog(
        context: context,
        builder: (contextDialog) => FailureDialog('Fill all fields!'),
      );
      return;
    }

    try {
      await this._webClient.login(email, password);
      Navigator.pushNamedAndRemoveUntil(
        context,
        Home.routeName,
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
}
