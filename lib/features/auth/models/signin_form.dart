import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignInForm {
  final phoneFormatter = MaskTextInputFormatter(
    mask: '+# (###) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isPhoneLogin = true;
  bool obscurePassword = true;

  String? validatePhone(String? value) {
    final unmasked = phoneFormatter.getUnmaskedText();
    if (unmasked.isEmpty) return 'Введите номер телефона';
    if (!RegExp(r'^\+?[0-9]{10,15}$').hasMatch(unmasked)) {
      return 'Введите корректный номер';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Введите email';
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Введите корректный email';
    }
    return null;
  }

  void dispose() {
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}