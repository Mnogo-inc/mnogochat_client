import 'package:flutter/material.dart';

class AuthElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool expanded;

  const AuthElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.expanded = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: expanded ? double.infinity : null,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          minimumSize: const Size(200, 50),
        ),
        child: Text(text),
      ),
    );
  }
}

class AuthOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool expanded;

  const AuthOutlinedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.expanded = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: expanded ? double.infinity : null,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          minimumSize: const Size(200, 50),
          side: BorderSide(color: Theme.of(context).colorScheme.primary),
        ),
        child: Text(text),
      ),
    );
  }
}