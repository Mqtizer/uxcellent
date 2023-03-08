import 'package:flutter/material.dart';

class UXImageFromName extends StatelessWidget {
  final String name;
  final Color? textColor;
  final Color? backgroundColor;
  final BoxDecoration? decoration;
  final double size;

  const UXImageFromName({
    super.key,
    required this.name,
    this.textColor,
    this.backgroundColor,
    this.decoration,
    this.size = 48,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    String initials = name.split(' ').map((word) => word[0]).join();

    return Container(
      width: size,
      height: size,
      decoration: decoration ??
          BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8),
            color: backgroundColor ?? colorScheme.primary,
          ),
      child: Center(
        child: Text(
          initials,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: textColor ?? colorScheme.onPrimary),
        ),
      ),
    );
  }
}
