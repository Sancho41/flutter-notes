import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterNotes/screens/login.dart';

class Home extends StatelessWidget {
  static final String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('Login'),
            onPressed: () => Navigator.pushNamed(context, Login.routeName),
          )
        ],
      ),
    );
  }
}
