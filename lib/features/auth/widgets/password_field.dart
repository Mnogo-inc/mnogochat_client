import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String labelText;
  final VoidCallback onVisibilityChanged;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;

  const PasswordField({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.labelText,
    required this.onVisibilityChanged,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: const Icon(Icons.lock),
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
          onPressed: onVisibilityChanged,
        ),
      ),
    );
  }
}