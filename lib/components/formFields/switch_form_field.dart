import 'package:flutter/material.dart';

import '../decorators/input_decoration.dart';

class UXSwitchFormField extends StatelessWidget {
  final bool value;
  final String label;
  final String helperText;
  final bool disabled;
  final ValueChanged<bool> onChanged;

  const UXSwitchFormField({
    this.value = false,
    super.key,
    required this.label,
    this.helperText = '',
    this.disabled = false,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;

    return InputDecorator(
      decoration: buildUXInputDecoration(
        context: context,
        labelText: label,
        disabled: disabled,
      ),
      child: SwitchListTile.adaptive(
        value: value,
        onChanged: (bool value) {
          if (disabled) return;
          onChanged(value);
        },
        title: Text(
          helperText,
          style: textTheme.titleMedium!.copyWith(
            color: disabled ? Colors.grey[500] : colorScheme.primary,
          ),
        ),
        activeColor: disabled ? Colors.grey[500] : colorScheme.primary,
        activeTrackColor:
            disabled ? Colors.grey[500] : colorScheme.primary.withOpacity(0.5),
        inactiveThumbColor:
            disabled ? Colors.grey[500] : colorScheme.primary.withOpacity(0.8),
        inactiveTrackColor:
            disabled ? Colors.grey[500] : colorScheme.primary.withOpacity(0.5),
      ),
    );
  }
}
