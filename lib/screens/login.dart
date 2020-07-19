import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterNotes/components/form_text_field.dart';
import 'package:flutterNotes/dtos/login_dto.dart';
import 'package:flutterNotes/layouts/layout_default.dart';
import 'package:flutterNotes/services/user_service.dart';

class Login extends StatefulWidget {
  static final String routeName = '/login';
  static final String name = 'Login';
  static final IconData icon = Icons.people;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _loginController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final UserService _service = new UserService();

  bool _loading = false;

  void _attempLogin(BuildContext context) async {
    setState(() => this._loading = true);
    await this._service.login(
          context,
          LoginDTO(
            email: this._loginController.text,
            password: this._passwordController.text,
          ),
        );
    setState(() => this._loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutDefault(
      lockRouteChange: this._loading,
      title: 'Login',
      child: Column(
        children: <Widget>[
          FormTextField(
            label: 'Email',
            controller: this._loginController,
            icon: Icons.assignment_ind,
            enabled: !this._loading,
          ),
          FormTextField(
            label: 'Password',
            controller: this._passwordController,
            icon: Icons.vpn_key,
            isPassword: true,
            actionSubmit: true,
            enabled: !this._loading,
            onSubmited: (_) => this._attempLogin(context),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: RaisedButton(
                child: Text(!this._loading ? 'Entrar' : 'Entrando...'),
                onPressed:
                    this._loading ? null : () => this._attempLogin(context),
              ),
            ),
          )
        ],
      ),
    );
  }
}
