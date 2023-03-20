import 'package:flutter/material.dart';

import '../theme/custom_color.dart';

extension ThemeDataContext on BuildContext {
  Color get bottomAppBarColor =>
      Theme.of(this).colorScheme.secondaryContainer.withAlpha(120);

  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  CustomColors get customColors => Theme.of(this).extension<CustomColors>()!;

  TextTheme get textTheme => Theme.of(this).textTheme;

  bool get isDark => Theme.of(this).brightness == Brightness.dark;
  LinearGradient get gradient => LinearGradient(
        begin: const Alignment(-0.115, -1),
        end: const Alignment(1, 1),
        colors: <Color>[
          colorScheme.surfaceVariant,
          colorScheme.tertiaryContainer
        ],
        stops: const <double>[0.608, 1],
      );
}
