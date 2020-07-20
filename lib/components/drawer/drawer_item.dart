import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String name;
  final String route;
  final IconData icon;
  final bool replace;
  final bool lock;

  DrawerItem({
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