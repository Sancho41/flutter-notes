import 'package:flutter/widgets.dart';
import 'package:flutterNotes/screens/home.dart';
import 'package:flutterNotes/screens/login.dart';

Map<String, WidgetBuilder> routes = {
  Home.routeName: (context) => Home(),
  Login.routeName: (context) => Login(),
};
