import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final bool obscureText;
  final bool autofocus;
  final TextInputType inputType;
  final Widget? suffixIcon;
  final String? prefixText; // Tambahan: prefix opsional

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
    this.obscureText = false,
    this.autofocus = false,
    this.inputType = TextInputType.text,
    this.suffixIcon,
    this.prefixText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      keyboardType: inputType,
      autofocus: autofocus,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixText: prefixText,
        prefixStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        errorStyle: const TextStyle(
          color: Colors.red
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1
          )
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
                color: Color(0xff050B79),
                width: 1
            )
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
                color: Colors.red,
                width: 1
            )
        ),
      ),
    );
  }
}
