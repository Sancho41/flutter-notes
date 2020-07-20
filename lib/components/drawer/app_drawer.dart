import 'package:flutter/material.dart';
import 'package:flutterNotes/components/drawer/default_list.dart';
import 'package:flutterNotes/components/drawer/logged_list.dart';
import 'package:flutterNotes/http/webclients/user_webclient.dart';
import 'package:flutterNotes/models/user.dart';
import 'package:flutterNotes/services/user_service.dart';

class AppDrawer extends StatefulWidget {
  final bool lockRouteChange;

  AppDrawer({this.lockRouteChange = false});

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  final UserService _service = new UserService();

  // ignore: missing_return
  Widget _asyncSnapsot(context, AsyncSnapshot<User> snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
      case ConnectionState.active:
      case ConnectionState.waiting:
        return Center(child: CircularProgressIndicator());
      case ConnectionState.done:
        if (snapshot.hasData && snapshot.data != null) {
          return LoggedList(
            lockedRoute: this.widget.lockRouteChange,
            user: snapshot.data,
          );
        } else {
          return DefaultList(
            lockedRoute: this.widget.lockRouteChange,
          );
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: FutureBuilder<User>(
        future: this._service.getUser(),
        builder: this._asyncSnapsot,
      ),
    );
  }
}
