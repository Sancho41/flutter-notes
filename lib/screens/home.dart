import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterNotes/layouts/layout_default.dart';

class Home extends StatelessWidget {
  static final String routeName = '/';

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
