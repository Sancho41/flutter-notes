import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterNotes/layouts/layout_default.dart';

class Login extends StatelessWidget {
  static final String routeName = '/login';
  static final String name = 'Login';
  static final IconData icon = Icons.people;

  @override
  Widget build(BuildContext context) {
    return LayoutDefault(
      title: 'Login',
      child: Column(
        children: <Widget>[
          Text('Login'),
        ],
      ),
    );
  }
}
