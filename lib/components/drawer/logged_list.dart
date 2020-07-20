import 'package:flutter/material.dart';
import 'package:flutterNotes/models/user.dart';
import 'package:flutterNotes/services/user_service.dart';

import 'drawer_item.dart';

class LoggedList extends StatelessWidget {
  final bool lockedRoute;
  final User user;
  final UserService _service = new UserService();

  LoggedList({@required this.lockedRoute, @required this.user});

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
            'EscreveAí: ${user.name}',
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
        DrawerItem(
          route: '/',
          name: 'Home',
          icon: Icons.home,
          lock: this.lockedRoute,
        ),
        InkWell(
          onTap: () async {
            Navigator.pop(context);
            await this._service.logout(context);
          },
          child: ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
          ),
        )
      ],
    );
  }

}