import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  TextFormFieldWidget({
    super.key,
    required this.validator,
    this.obscureText = false,
    required this.controller
  });

  String? Function(String?)? validator;
  bool obscureText;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        )
      ),
      validator: validator,
      obscureText: obscureText,
    );
  }
}