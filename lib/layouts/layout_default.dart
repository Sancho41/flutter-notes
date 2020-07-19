import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterNotes/components/app_drawer.dart';

class LayoutDefault extends StatelessWidget {
  final Widget child;
  final String title;

  LayoutDefault({@required this.child, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      drawer: AppDrawer(),
      body: this.child,
    );
  }
}
