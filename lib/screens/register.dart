import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterNotes/layouts/layout_default.dart';

class Register extends StatelessWidget {
  static final String routeName = '/register';
  static final String name = 'Register';
  static final IconData icon = Icons.vpn_key;

  @override
  Widget build(BuildContext context) {
    return LayoutDefault(
      title: name,
      child: Column(
        children: <Widget>[
          Text('Login'),
        ],
      ),
    );
  }
}
