import 'package:flutter/material.dart';

import '../../ui_helpers.dart';

listTileTheme(ColorScheme colorScheme, TextTheme textTheme) =>
    ListTileThemeData(
      tileColor: colorScheme.surface,
      selectedTileColor: colorScheme.primaryContainer,
      textColor: colorScheme.onSurface,
      subtitleTextStyle: textTheme.bodyMedium,
      titleTextStyle: textTheme.bodyLarge,
      iconColor: colorScheme.onSurface,
      visualDensity: VisualDensity.standard,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      shape: roundShapeSmall,
    );
