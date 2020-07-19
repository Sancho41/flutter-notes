import 'package:flutter/material.dart';
import 'package:flutterNotes/routes.dart';
import 'package:flutterNotes/screens/home.dart';

void main() {
  runApp(EscreveAi());
}

class EscreveAi extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      routes: routes,
      initialRoute: Home.routeName,
    );
  }
}
