import 'package:flutter/material.dart';

import '../../app_platform.dart';

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
        minimumSize: Size(0.0, isIOS ? 40.0 : 48.0),
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        textStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
      ),
    );

outlinedButtonTheme(ColorScheme colorScheme) => OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: Size(0.0, isIOS ? 40.0 : 48.0),
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.primary,
        textStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
      ),
    );

textButtonTheme(ColorScheme colorScheme) => TextButtonThemeData(
      style: TextButton.styleFrom(
        minimumSize: Size(0.0, isIOS ? 40.0 : 48.0),
        backgroundColor: colorScheme.background,
        foregroundColor: colorScheme.tertiary,
        alignment: Alignment.centerLeft,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
      ),
    );
