import 'package:flutter/material.dart';
import 'package:uxcellent/uxcellent.dart';

extension ThemeDataContext on BuildContext {
  Color get bottomAppBarColor =>
      Theme.of(this).colorScheme.secondaryContainer.withAlpha(120);

  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  CustomColors get customColors => Theme.of(this).extension<CustomColors>()!;

  TextTheme get textTheme => Theme.of(this).textTheme;
}
