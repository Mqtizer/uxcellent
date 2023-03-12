import 'package:flutter/material.dart';

class UXInitialsAvatar extends StatelessWidget {
  final String? name;
  final String? imageUrl;
  final Color? textColor;
  final Color? backgroundColor;
  final double? borderRadius;
  final BoxShadow? boxShadow;
  final double size;
  final BoxFit fit;

  const UXInitialsAvatar({
    super.key,
    this.name,
    this.imageUrl,
    this.textColor,
    this.backgroundColor,
    this.borderRadius,
    this.boxShadow,
    this.size = 40,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    final bool isImage = imageUrl != null;

    return Container(
      
      width: size,
      height: size,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(borderRadius ?? 8),
        color: !isImage
            ? backgroundColor ?? colorScheme.primary
            : Colors.transparent,
        boxShadow: isImage
            ? []
            : [
                boxShadow ??
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    )
              ],
        image: isImage
            ? DecorationImage(
                image: NetworkImage(imageUrl!),
                fit: fit,
              )
            : null,
      ),
      child: isImage
          ? null
          : Center(
              child: name != null
                  ? Text(
                      getFirstTwoInitials(name!),
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: textColor ?? colorScheme.onPrimary),
                    )
                  : Icon(
                      Icons.person,
                      color: textColor ?? colorScheme.onPrimary,
                    ),
            ),
    );
  }
}

String getFirstTwoInitials(String name) {
  List<String> nameList = name.split(' ');
  return nameList[0][0] + nameList[1][0];
}
