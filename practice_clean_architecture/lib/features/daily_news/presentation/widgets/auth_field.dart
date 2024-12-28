import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final TextEditingController controller;
  final String hinttext;
  final bool isObsecureText;

  const AuthField({
    super.key,
    required this.hinttext,
    required this.controller,
    this.isObsecureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return "$hinttext is missing";
        }
        return null;
      },
      decoration: InputDecoration(hintText: hinttext),
      obscureText: isObsecureText,
    );
  }
}
