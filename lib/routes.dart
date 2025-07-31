import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'features/auth/screens/welcome_screen.dart';
import 'features/auth/screens/chat_screen.dart';
import 'features/auth/screens/signup_screen.dart';
import 'features/auth/screens/signin_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: '/signin',
      builder: (context, state) => const SignInScreen(),
    ),
    GoRoute(
      path: '/chat',
      builder: (context, state) => const ChatScreen(),
    ),
  ],
);