import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mnogochat_v1/features/auth/models/signup_form.dart';

class SignUpInputFields extends StatelessWidget {
  final SignUpForm form;
  final VoidCallback onPasswordVisibilityChanged;

  const SignUpInputFields({
    super.key,
    required this.form,
    required this.onPasswordVisibilityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Поле телефона/email
        if (form.isPhoneRegistration)
          TextFormField(
            controller: form.phoneController,
            keyboardType: TextInputType.phone,
            inputFormatters: [form.phoneFormatter],
            decoration: const InputDecoration(
              labelText: 'Номер телефона',
              prefixIcon: Icon(Icons.phone),
            ),
            validator: form.validatePhone,
          )
        else
          TextFormField(
            controller: form.emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Icons.email),
            ),
            validator: form.validateEmail,
          ),

        const SizedBox(height: 20),

        // Поле пароля
        TextFormField(
          controller: form.passwordController,
          obscureText: form.obscurePassword,
          decoration: InputDecoration(
            labelText: 'Пароль',
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: IconButton(
              icon: Icon(form.obscurePassword 
                  ? Icons.visibility_off 
                  : Icons.visibility),
              onPressed: onPasswordVisibilityChanged,
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) return 'Введите пароль';
            if (value.length < 6) return 'Пароль должен быть не менее 6 символов';
            return null;
          },
        ),
      ],
    );
  }
}