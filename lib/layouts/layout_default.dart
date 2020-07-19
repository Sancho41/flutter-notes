import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterNotes/components/app_drawer.dart';

class LayoutDefault extends StatelessWidget {
  final Widget child;
  final String title;
  final bool lockRouteChange;

  LayoutDefault({@required this.child, this.title, this.lockRouteChange = false});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => !this.lockRouteChange,
      child: Scaffold(
        appBar: AppBar(
          title: Text(this.title),
        ),
        drawer: AppDrawer(lockRouteChange: this.lockRouteChange),
        body: this.child,
      ),
    );
  }
}
