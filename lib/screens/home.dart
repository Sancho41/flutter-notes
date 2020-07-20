import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterNotes/http/webclients/user_webclient.dart';
import 'package:flutterNotes/layouts/layout_default.dart';
import 'package:flutterNotes/models/user.dart';

class Home extends StatefulWidget {
  static final String routeName = '/';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final UserWebClient _webClient = new UserWebClient();

  String userName;

  @override
  Widget build(BuildContext context) {
    return LayoutDefault(
      title: 'Home',
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'EscreveAí',
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
