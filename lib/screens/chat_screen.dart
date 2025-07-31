import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Чаты")),
      body: ListView(
        children: const [
          ListTile(title: Text("Чат 1")),
          ListTile(title: Text("Чат 2")),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/'),
        child: const Icon(Icons.exit_to_app),
      ),
    );
  }
}