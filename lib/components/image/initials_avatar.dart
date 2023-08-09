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
  final BoxShape shape;
  final bool? showShadow;

  const UXInitialsAvatar({
    super.key,
    this.name = "Mqtizer",
    this.imageUrl,
    this.textColor,
    this.backgroundColor,
    this.borderRadius,
    this.boxShadow,
    this.size = 40,
    this.fit = BoxFit.contain,
    this.shape = BoxShape.rectangle,
    this.showShadow = false,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Widget loader = SizedBox(
      width: size,
      height: size,
      child: const CircularProgressIndicator(),
    );
    final Widget container = Container(
      alignment: Alignment.center,
      width: size,
      height: size,
      clipBehavior: Clip.antiAlias,
      decoration:
          _buildDecoration(showShadow ?? false, colorScheme.secondaryContainer),
      child: Text(
        getFirstTwoInitials(name),
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: textColor ?? colorScheme.onSecondaryContainer,
              fontSize: size / 2.5,
            ),
      ),
    );
    if (!isValidURL(imageUrl)) {
      return container;
    } else {
      return CachedNetworkImage(
        imageUrl: imageUrl!,
        placeholder: (context, url) => loader,
        imageBuilder: (context, imageProvider) => Container(
          width: size,
          height: size,
          clipBehavior: Clip.antiAlias,
          decoration: _buildDecoration(
              showShadow ?? false, backgroundColor ?? colorScheme.primary),
          child: Image(
            image: imageProvider,
            fit: fit,
          ),
        ),
        errorWidget: (context, url, error) {
          return container;
        },
      );
    }
  }

  BoxDecoration _buildDecoration(bool shadow, Color backgroundColor) {
    return BoxDecoration(
      shape: shape,
      borderRadius: shape == BoxShape.rectangle
          ? BorderRadius.circular(borderRadius ?? 8)
          : null,
      color: backgroundColor,
      boxShadow: shadow
          ? [
              boxShadow ??
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
            ]
          : [],
    );
  }
}

String getFirstTwoInitials(String name) {
  try {
    if (name.isEmpty) return "";
    List<String> nameList = name.trim().split(' ');
    if (nameList.length == 1) return nameList[0][0].toUpperCase();
    return nameList[0][0].toUpperCase() + nameList[1][0].toUpperCase();
  } catch (e) {
    return "-NA-";
  }
}

bool isValidURL(String? url) {
  if (url == null || url.isEmpty) return false;
  Uri? uri = Uri.tryParse(url);
  if (uri == null || !uri.hasAbsolutePath || uri.host.isEmpty) return false;
  return true;
}
