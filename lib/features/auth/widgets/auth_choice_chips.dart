import 'package:flutter/material.dart';

class AuthChoiceChips extends StatelessWidget {
  final bool isPhoneRegistration;
  final ValueChanged<bool> onChanged;

  const AuthChoiceChips({
    super.key,
    required this.isPhoneRegistration,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ChoiceChip(
          label: const Text('По телефону'),
          selected: isPhoneRegistration,
          selectedColor: Theme.of(context).colorScheme.primaryContainer,
          onSelected: (selected) => onChanged(selected),
        ),
        const SizedBox(width: 20),
        ChoiceChip(
          label: const Text('По email'),
          selected: !isPhoneRegistration,
          selectedColor: Theme.of(context).colorScheme.primaryContainer,
          onSelected: (selected) => onChanged(!selected),
        ),
      ],
    );
  }
}