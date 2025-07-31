import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mnogochat_v1/features/auth/widgets/auth_button.dart';
import 'package:mnogochat_v1/features/auth/widgets/welcome_header.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const WelcomeHeader(),
                ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: 200, maxWidth: 300),
                  child: Column(
                    children: [
                      AuthElevatedButton(
                        text: "Войти",
                        onPressed: () => context.go('/signin'),
                        expanded: true,
                      ),
                      const SizedBox(height: 15),
                      AuthOutlinedButton(
                        text: "Зарегистрироваться",
                        onPressed: () => context.go('/signup'),
                        expanded: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}