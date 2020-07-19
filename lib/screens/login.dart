import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterNotes/components/response_dialog.dart';
import 'package:flutterNotes/http/exceptions/http_exception.dart';
import 'package:flutterNotes/http/webclients/user_webclient.dart';
import 'package:flutterNotes/layouts/layout_default.dart';
import 'package:flutterNotes/screens/home.dart';

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
  final UserWebClient _webClient = new UserWebClient();
  bool _loading = false;

  void _attemptLogin([_]) async {
    String login = this._loginController.text;
    String password = this._passwordController.text;

    setState(() => this._loading = true);

    if (login.isEmpty || password.isEmpty) {
      await showDialog(
        context: context,
        builder: (contextDialog) => FailureDialog('Preencha todos os campos!'),
      );
      setState(() => this._loading = false);
      return;
    }

    try {
      await this._webClient.login(login, password);
      await showDialog(
        context: context,
        builder: (contextDialog) => SuccessDialog('Logado com sucesso!'),
      );
      Navigator.pushNamedAndRemoveUntil(
        context,
        Home.routeName,
        (route) => true,
      );
    } on HttpException catch (error) {
      await showDialog(
        context: context,
        builder: (contextDialog) => FailureDialog(error.message),
      );
    } catch (error) {
      print(error.message);
    } finally {
      setState(() => this._loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutDefault(
      lockRouteChange: this._loading,
      title: 'Login',
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.assignment_ind),
                labelText: 'Login',
              ),
              controller: this._loginController,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              onSubmitted: (_) => FocusScope.of(context).nextFocus(),
              enabled: !this._loading,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              obscureText: true,
              controller: this._passwordController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.vpn_key),
                labelText: 'Password',
              ),
              autocorrect: false,
              onSubmitted: this._attemptLogin,
              enabled: !this._loading,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: RaisedButton(
                child: Text(!this._loading ? 'Entrar' : 'Entrando...'),
                onPressed: this._loading ? null : this._attemptLogin,
              ),
            ),
          )
        ],
      ),
    );
  }
}
