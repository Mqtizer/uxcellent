import 'package:flutter/material.dart';

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
  EdgeInsetsGeometry contentPadding = const EdgeInsets.all(16),
}) {
  ColorScheme colorScheme = Theme.of(context).colorScheme;
  TextTheme textTheme = Theme.of(context).textTheme;
  return InputDecoration(
    contentPadding: contentPadding,
    labelText: labelText == "" ? null : labelText,
    helperText: helperText == "" ? null : helperText,
    hintText: hintText == "" ? null : hintText,
    errorText: errorText,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    labelStyle: textTheme.titleLarge!.copyWith(
      color: disabled ? Colors.grey[500] : colorScheme.primary,
    ),
    alignLabelWithHint: true,
    helperStyle: textTheme.titleSmall!.copyWith(
      color: disabled ? Colors.grey[500] : colorScheme.primary,
    ),
    helperMaxLines: 5,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(
        color: colorScheme.primary,
        width: 1.4,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(
        color: colorScheme.primary,
        width: 1.4,
      ),
    ),
    suffixIcon: suffixIcon,
    prefixIcon: prefixIcon,
    suffix: suffix,
    prefix: prefix,
  );
}
