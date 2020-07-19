import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterNotes/components/form_text_field.dart';
import 'package:flutterNotes/dtos/register_user_dto.dart';
import 'package:flutterNotes/layouts/layout_default.dart';
import 'package:flutterNotes/services/user_service.dart';

class Register extends StatefulWidget {
  static final String routeName = '/register';
  static final String name = 'Register';
  static final IconData icon = Icons.vpn_key;

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _loading = false;

  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _passwordConfirmationController =
      new TextEditingController();

  final UserService _service = new UserService();

  void _attemptRegister(BuildContext context) async {
    setState(() => this._loading = true);
    RegisterUserDTO registerUserDTO = new RegisterUserDTO(
      email: _emailController.text,
      name: _nameController.text,
      password: _passwordController.text,
      passwordConfirmation: _passwordConfirmationController.text,
    );

    await this._service.register(context, registerUserDTO);

    setState(() => this._loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutDefault(
      lockRouteChange: this._loading,
      title: Register.name,
      child: ListView(
        children: <Widget>[
          FormTextField(
            label: 'Email',
            controller: _emailController,
            icon: Icons.assignment_ind,
            enabled: !this._loading,
          ),
          FormTextField(
            label: 'Name',
            controller: _nameController,
            icon: Icons.person,
            enabled: !this._loading,
          ),
          FormTextField(
            label: 'Password',
            controller: _passwordController,
            icon: Icons.vpn_key,
            enabled: !this._loading,
            isPassword: true,
          ),
          FormTextField(
            label: 'Confirm Password',
            controller: _passwordConfirmationController,
            icon: Icons.vpn_key,
            enabled: !this._loading,
            actionSubmit: true,
            isPassword: true,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: RaisedButton(
                child: Text(!this._loading ? 'Register' : 'Registering...'),
                onPressed:
                    this._loading ? null : () => this._attemptRegister(context),
              ),
            ),
          )
        ],
      ),
    );
  }
}
