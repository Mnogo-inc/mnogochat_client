import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpForm {
  final phoneFormatter = MaskTextInputFormatter(
    mask: '+# (###) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool isPhoneRegistration = true;
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  static const phoneRegex = r'^\+?[0-9]{10,15}$';
  static const emailRegex = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';

  String? validatePhone(String? value) {
    final unmasked = phoneFormatter.getUnmaskedText();
    if (unmasked.isEmpty) return 'Введите номер телефона';
    if (!RegExp(phoneRegex).hasMatch(unmasked)) return 'Введите корректный номер';
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Введите email';
    if (!RegExp(emailRegex).hasMatch(value)) return 'Введите корректный email';
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Введите пароль';
    if (value.length < 6) return 'Пароль должен быть не менее 6 символов';
    if (!value.contains(RegExp(r'[A-Z]'))) return 'Добавьте хотя бы одну заглавную букву';
    if (!value.contains(RegExp(r'[0-9]'))) return 'Добавьте хотя бы одну цифру';
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value != passwordController.text) return 'Пароли не совпадают';
    return null;
  }

  void dispose() {
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }
}