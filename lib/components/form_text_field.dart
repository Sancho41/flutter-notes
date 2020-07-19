import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormTextField extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isPassword;
  final bool enabled;
  final bool actionSubmit;
  final TextEditingController controller;
  final Function onSubmited;

  FormTextField({
    @required this.label,
    @required this.controller,
    this.icon,
    this.enabled = true,
    this.actionSubmit = false,
    this.isPassword = false,
    this.onSubmited,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        obscureText: this.isPassword,
        decoration: InputDecoration(
          prefixIcon: Icon(this.icon),
          labelText: this.label,
        ),
        controller: this.controller,
        autocorrect: false,
        textInputAction:
            this.actionSubmit ? TextInputAction.done : TextInputAction.next,
        onSubmitted:
            this.onSubmited ?? (_) => FocusScope.of(context).nextFocus(),
        enabled: this.enabled,
        inputFormatters: [
          BlacklistingTextInputFormatter(RegExp("[\\t]")),
        ],
      ),
    );
  }
}
