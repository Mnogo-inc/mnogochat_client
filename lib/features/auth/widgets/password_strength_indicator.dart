import 'package:flutter/material.dart';

class PasswordStrengthIndicator extends StatelessWidget {
  final String password;
  
  const PasswordStrengthIndicator({
    super.key,
    required this.password,
  });

  double _getStrengthValue() {
    if (password.isEmpty) return 0;
    if (password.length < 6) return 0.3;
    if (password.length < 8) return 0.6;
    if (!password.contains(RegExp(r'[0-9]'))) return 0.8;
    if (!password.contains(RegExp(r'[A-Z]'))) return 0.8;
    return 1.0;
  }

  String _getStrengthText() {
    final value = _getStrengthValue();
    if (value == 0) return '';
    if (value <= 0.3) return 'Слабый';
    if (value <= 0.6) return 'Средний';
    if (value <= 0.8) return 'Хороший';
    return 'Отличный';
  }

  Color _getStrengthColor() {
    final value = _getStrengthValue();
    if (value <= 0.3) return Colors.red;
    if (value <= 0.6) return Colors.orange;
    if (value <= 0.8) return Colors.blue;
    return Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LinearProgressIndicator(
          value: _getStrengthValue(),
          minHeight: 4,
          backgroundColor: Colors.grey[300],
          color: _getStrengthColor(),
        ),
        const SizedBox(height: 4),
        Text(
          _getStrengthText(),
          style: TextStyle(
            color: _getStrengthColor(),
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}