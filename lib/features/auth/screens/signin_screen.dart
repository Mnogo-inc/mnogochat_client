import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mnogochat_v1/features/auth/models/signin_form.dart';
import 'package:mnogochat_v1/features/auth/widgets/auth_button.dart';
import 'package:mnogochat_v1/features/auth/widgets/auth_choice_chips.dart';
import 'package:mnogochat_v1/features/auth/widgets/auth_divider.dart';
import 'package:mnogochat_v1/features/auth/widgets/auth_text_field.dart';
import 'package:mnogochat_v1/features/auth/widgets/forgot_password_link.dart';
import 'package:mnogochat_v1/features/auth/widgets/password_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _form = SignInForm();

  @override
  void dispose() {
    _form.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Вход выполнен!')),
      );
      context.go('/chat');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Вход'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
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
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Войдите в аккаунт',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),

                  AuthChoiceChips(
                    isPhoneRegistration: _form.isPhoneLogin,
                    onChanged: (value) => setState(() {
                      _form.isPhoneLogin = value;
                    }),
                  ),
                  const SizedBox(height: 30),

                  if (_form.isPhoneLogin)
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

                  PasswordField(
                    controller: _form.passwordController,
                    obscureText: _form.obscurePassword,
                    labelText: 'Пароль',
                    onVisibilityChanged: () => setState(() {
                      _form.obscurePassword = !_form.obscurePassword;
                    }),
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Введите пароль';
                      return null;
                    },
                  ),

                  const SizedBox(height: 10),

                  ForgotPasswordLink(
                    onPressed: () {
                      // TODO: Реализовать восстановление пароля
                    },
                  ),

                  const SizedBox(height: 30),

                  AuthElevatedButton(
                    text: 'Войти',
                    onPressed: _submit,
                    expanded: true,
                  ),

                  const SizedBox(height: 20),
                  const AuthDivider(),
                  const SizedBox(height: 20),

                  TextButton(
                    onPressed: () => context.go('/signup'),
                    child: const Text('Ещё нет аккаунта? Зарегистрироваться'),
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