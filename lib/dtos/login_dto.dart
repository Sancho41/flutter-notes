import 'dart:convert';

import 'package:flutter/widgets.dart';

class LoginDTO {
  final String email;
  final String password;

  LoginDTO({
    @required this.email,
    @required this.password,
  });

  bool hasEmptyFields() {
    return this.email.isEmpty || this.password.isEmpty;
  }

  String toJson() {
    return jsonEncode({
      'email': this.email,
      'password': this.password,
    });
  }
}
