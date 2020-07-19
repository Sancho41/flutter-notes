import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterNotes/screens/login.dart';
import 'package:flutterNotes/screens/register.dart';

class _DrawerItem extends StatelessWidget {
  final String name;
  final String route;
  final IconData icon;
  final bool replace;
  final bool lock;

  _DrawerItem({
    @required this.route,
    this.name = '',
    this.icon,
    this.replace = false,
    this.lock = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        bool isSame = false;
        Navigator.popUntil(context, (route) {
          isSame = route.settings.name == this.route;
          return true;
        });

        Navigator.pop(context);
        if (!isSame && !this.lock) {
          if (this.replace)
            Navigator.pushReplacementNamed(context, this.route);
          else
            Navigator.pushNamed(context, this.route);
        }
      },
      child: ListTile(
        leading: Icon(this.icon),
        title: Text(this.name),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  final bool lockRouteChange;

  AppDrawer({this.lockRouteChange = false});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
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
          _DrawerItem(
            route: Login.routeName,
            name: Login.name,
            icon: Login.icon,
            lock: this.lockRouteChange,
          ),
          _DrawerItem(
            route: Register.routeName,
            name: Register.name,
            icon: Register.icon,
            lock: this.lockRouteChange,
          ),
        ],
      ),
    );
  }
}
