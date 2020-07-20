import 'package:flutter/material.dart';
import 'package:flutterNotes/screens/login.dart';
import 'package:flutterNotes/screens/register.dart';

import 'drawer_item.dart';

class DefaultList extends StatelessWidget {
  final bool lockedRoute;

  DefaultList({@required this.lockedRoute});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
          ),
          child: Text(
            'EscreveAí',
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
        DrawerItem(
          route: Login.routeName,
          name: Login.name,
          icon: Login.icon,
          lock: this.lockedRoute,
        ),
        DrawerItem(
          route: Register.routeName,
          name: Register.name,
          icon: Register.icon,
          lock: this.lockedRoute,
        )
      ],
    );
  }
}