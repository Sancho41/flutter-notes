import 'dart:convert';

import 'package:flutter/material.dart';

class RegisterUserDTO {
  final String email;
  final String name;
  final String password;
  final String passwordConfirmation;

  RegisterUserDTO({
    @required this.email,
    @required this.name,
    @required this.password,
    @required this.passwordConfirmation,
  });

  bool hasEmptyFields() {
    return this.email.isEmpty ||
        this.name.isEmpty ||
        this.password.isEmpty ||
        this.passwordConfirmation.isEmpty;
  }

  String toJson() {
    return jsonEncode({
      'email': this.email,
      'name': this.name,
      'password': this.password,
      'password_confirmation': this.password
    });
  }
}
