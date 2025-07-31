import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mnogochat_v1/features/auth/models/signup_form.dart';
import 'package:mnogochat_v1/features/auth/widgets/auth_button.dart';
import 'package:mnogochat_v1/features/auth/widgets/auth_choice_chips.dart';
import 'package:mnogochat_v1/features/auth/widgets/auth_divider.dart';
import 'package:mnogochat_v1/features/auth/widgets/auth_text_field.dart';
import 'package:mnogochat_v1/features/auth/widgets/password_field.dart';
import 'package:mnogochat_v1/features/auth/widgets/password_strength_indicator.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _form = SignUpForm();

  @override
  void dispose() {
    _form.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final identifier = _form.isPhoneRegistration
          ? _form.phoneController.text
          : _form.emailController.text;
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Регистрация $identifier выполнена!')),
      );
      context.go('/chat');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Регистрация'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/signin'),
        ),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Text('Создайте аккаунт', style: TextStyle(fontSize: 24)),
                  const SizedBox(height: 30),
                  
                  AuthChoiceChips(
                    isPhoneRegistration: _form.isPhoneRegistration,
                    onChanged: (value) => setState(() {
                      _form.isPhoneRegistration = value;
                    }),
                  ),
                  
                  const SizedBox(height: 30),
                  
                  if (_form.isPhoneRegistration)
                    AuthTextField(
                      controller: _form.phoneController,
                      labelText: 'Номер телефона',
                      icon: Icons.phone,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [_form.phoneFormatter],
                      validator: _form.validatePhone,
                    )
                  else
                    AuthTextField(
                      controller: _form.emailController,
                      labelText: 'Email',
                      icon: Icons.email,
                      keyboardType: TextInputType.emailAddress,
                      validator: _form.validateEmail,
                    ),

                  const SizedBox(height: 20),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PasswordField(
                        controller: _form.passwordController,
                        obscureText: _form.obscurePassword,
                        labelText: 'Пароль',
                        onVisibilityChanged: () => setState(() {
                          _form.obscurePassword = !_form.obscurePassword;
                        }),
                        onChanged: (value) => setState(() {}),
                        validator: _form.validatePassword,
                      ),
                      const SizedBox(height: 4),
                      PasswordStrengthIndicator(
                        password: _form.passwordController.text,
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  PasswordField(
                    controller: _form.confirmPasswordController,
                    obscureText: _form.obscureConfirmPassword,
                    labelText: 'Подтвердите пароль',
                    onVisibilityChanged: () => setState(() {
                      _form.obscureConfirmPassword = !_form.obscureConfirmPassword;
                    }),
                    validator: _form.validateConfirmPassword,
                  ),

                  const SizedBox(height: 30),

                  AuthElevatedButton(
                    text: 'Зарегистрироваться',
                    onPressed: _submitForm,
                    expanded: true,
                  ),

                  const SizedBox(height: 20),
                  const AuthDivider(),
                  const SizedBox(height: 20),

                  TextButton(
                    onPressed: () => context.go('/signin'),
                    child: const Text('Уже есть аккаунт? Войти'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}