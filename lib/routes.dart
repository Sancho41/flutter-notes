import 'package:flutter/widgets.dart';
import 'package:flutterNotes/screens/home.dart';
import 'package:flutterNotes/screens/login.dart';
import 'package:flutterNotes/screens/register.dart';

Map<String, WidgetBuilder> routes = {
  Home.routeName: (context) => Home(),

  Register.routeName: (context) => Register(),
  Login.routeName: (context) => Login(),
};
