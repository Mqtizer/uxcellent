import 'package:flutter/material.dart';

floatingActionButtonTheme(ColorScheme colorscheme) =>
    FloatingActionButtonThemeData(
      backgroundColor: colorscheme.primary,
      foregroundColor: colorscheme.onPrimary,
      elevation: 0.0,
      sizeConstraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );

elevatedButtonTheme(ColorScheme colorScheme) => ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(48),
        backgroundColor: colorScheme.primaryContainer,
        foregroundColor: colorScheme.onPrimaryContainer,
        textStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );

outlinedButtonTheme(ColorScheme colorScheme) => OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size.fromHeight(48),
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.primary,
        textStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );

textButtonTheme(ColorScheme colorScheme) => TextButtonThemeData(
      style: TextButton.styleFrom(
        minimumSize: const Size.fromHeight(40),
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.tertiary,
        alignment: Alignment.centerLeft,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );
