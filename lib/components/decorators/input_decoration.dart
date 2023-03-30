import 'package:flutter/material.dart';

import '../../app_platform.dart';
import '../../theme/custom_color.dart';

InputDecoration buildUXInputDecoration({
  required BuildContext context,
  bool disabled = false,
  String labelText = "",
  String helperText = "",
  String hintText = "",
  Widget? suffixIcon,
  Widget? prefixIcon,
  Widget? suffix,
  Widget? prefix,
  String? errorText,
  EdgeInsetsGeometry? contentPadding,
}) {
  final colorScheme = Theme.of(context).colorScheme;
  final textTheme = Theme.of(context).textTheme;
  final CustomColors customColors =
      Theme.of(context).extension<CustomColors>()!;
  final borderSide = BorderSide(
    color: disabled
        ? colorScheme.onSurface.withOpacity(0.12)
        : colorScheme.onSurface.withOpacity(0.32),
  );
  final borderRadius = BorderRadius.circular(isIOS ? 8 : 4);

  return InputDecoration(
    contentPadding: contentPadding ??
        EdgeInsets.symmetric(horizontal: 16, vertical: isIOS ? 12 : 16),
    labelText: labelText.isEmpty ? null : labelText,
    helperText: helperText.isEmpty ? null : helperText,
    errorText: errorText,
    errorStyle: textTheme.labelLarge!.copyWith(
      color: customColors.mqtizernegative,
    ),
    errorMaxLines: 5,
    floatingLabelBehavior:
        isIOS ? FloatingLabelBehavior.never : FloatingLabelBehavior.always,
    labelStyle: !isIOS
        ? textTheme.titleLarge!.copyWith(
            color: disabled ? Colors.grey[500] : colorScheme.primary,
          )
        : textTheme.titleMedium!.copyWith(
            color: disabled ? Colors.grey[500] : colorScheme.primary,
          ),
    alignLabelWithHint: true,
    helperStyle: textTheme.labelLarge!.copyWith(
      color: disabled ? Colors.grey[500] : colorScheme.primary,
    ),
    // hintText: hintText.isEmpty ? labelText : hintText,
    // hintStyle: textTheme.labelMedium!.copyWith(
    //   color: disabled ? Colors.grey[500] : colorScheme.primary,
    // ),
    helperMaxLines: 5,
    suffixIcon: suffixIcon,
    prefixIcon: prefixIcon,
    suffix: suffix,
    prefix: prefix,
    border: OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: borderSide,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: borderSide,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: borderSide,
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: borderSide.copyWith(
        color: colorScheme.error,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: borderSide,
    ),
  );
}
