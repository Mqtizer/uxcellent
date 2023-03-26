import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UXInitialsAvatar extends StatelessWidget {
  final String name;
  final String? imageUrl;
  final Color? textColor;
  final Color? backgroundColor;
  final double? borderRadius;
  final BoxShadow? boxShadow;
  final double size;
  final BoxFit fit;

  const UXInitialsAvatar({
    super.key,
    this.name = "Mqtizer",
    this.imageUrl = "https://www.mqtizer.com/images/mqtizer-logo.png",
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

    return CachedNetworkImage(
      imageUrl: imageUrl ?? "",
      placeholder: (context, url) => const CircularProgressIndicator(),
      imageBuilder: (context, imageProvider) => Container(
        width: size,
        height: size,
        clipBehavior: Clip.antiAlias,
        decoration:
            _buildDecoration(true, backgroundColor ?? colorScheme.primary),
        child: Image(
          image: imageProvider,
          fit: fit,
        ),
      ),
      errorWidget: (context, url, error) => Container(
        alignment: Alignment.center,
        width: size,
        height: size,
        clipBehavior: Clip.antiAlias,
        decoration: _buildDecoration(true, colorScheme.secondaryContainer),
        child: Text(
          getFirstTwoInitials(name),
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: textColor ?? colorScheme.onSecondaryContainer,
                fontSize: size / 2.5,
              ),
        ),
      ),
    );
  }

  BoxDecoration _buildDecoration(bool shadow, Color backgroundColor) {
    return BoxDecoration(
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(borderRadius ?? 8),
      color: backgroundColor,
      boxShadow: shadow
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
    );
  }
}

String getFirstTwoInitials(String name) {
  if (name.isEmpty) return "";
  List<String> nameList = name.split(' ');
  if (nameList.length == 1) return nameList[0][0].toUpperCase();
  return nameList[0][0].toUpperCase() + nameList[1][0].toUpperCase();
}
