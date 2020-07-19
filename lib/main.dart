import 'package:flutter/material.dart';
import 'package:flutterNotes/routes.dart';

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
    );
  }
}
