import 'package:flutter/material.dart';

ButtonStyle buildUXButtonDecoration(ColorScheme colorScheme, bool disabled) {
  return ButtonStyle(
    foregroundColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return disabled ? Colors.grey : colorScheme.onPrimary;
        }
        return disabled ? Colors.grey : colorScheme.onPrimaryContainer;
      },
    ),
    backgroundColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return disabled ? Colors.grey : colorScheme.primary;
        }
        return disabled ? Colors.grey : colorScheme.primaryContainer;
      },
    ),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
    shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
  );
}
