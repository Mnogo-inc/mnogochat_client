import 'package:go_router/go_router.dart';
import 'screens/auth_screen.dart';
import 'screens/chat_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const AuthScreen(),
    ),
    GoRoute(
      path: '/chat',
      builder: (context, state) => const ChatScreen(),
    ),
  ],
);

