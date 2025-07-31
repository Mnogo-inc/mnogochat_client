import 'package:flutter/material.dart';

class WelcomeHeader extends StatelessWidget {
  const WelcomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Добро пожаловать!",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          "Войдите или зарегистрируйтесь, чтобы продолжить",
          style: TextStyle(
            fontSize: 16, 
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 40),
        Container(
          height: 200,
          margin: const EdgeInsets.only(bottom: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey[100],
          ),
          child: Icon(
            Icons.chat_bubble_outline,
            size: 100,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }
}