import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool isPassword;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Color fillColor;
  final Color textColor;
  final TextStyle labelStyle;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    required this.fillColor,
    required this.textColor,
    required this.labelStyle,
    required void Function(dynamic _) onFieldSubmitted,
    required Color foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: labelStyle,
          fillColor: fillColor,
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 12.0,
          ),
        ),
        obscureText: isPassword,
        keyboardType: keyboardType,
        validator: validator,
      ),
    );
  }
}
