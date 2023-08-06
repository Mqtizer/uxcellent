import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Widget container = Container(
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
    );
    if (!isValidURL(imageUrl)) {
      return container;
    } else {
      return FutureBuilder(
        future: validateImage(imageUrl!),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data == true) {
            return CachedNetworkImage(
              imageUrl: imageUrl!,
              placeholder: (context, url) => const CircularProgressIndicator(),
              imageBuilder: (context, imageProvider) => Container(
                width: size,
                height: size,
                clipBehavior: Clip.antiAlias,
                decoration: _buildDecoration(
                    true, backgroundColor ?? colorScheme.primary),
                child: Image(
                  image: imageProvider,
                  fit: fit,
                ),
              ),
              errorWidget: (context, url, error) {
                return container;
              },
            );
          } else {
            return container;
          }
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

Future<bool> validateImage(String imageUrl) async {
  http.Response res;
  try {
    res = await http.get(Uri.parse(imageUrl));
  } catch (e) {
    return false;
  }

  if (res.statusCode != 200) return false;
  Map<String, dynamic> data = res.headers;
  return checkIfImage(data['content-type']);
}

bool checkIfImage(String param) {
  if (param == 'image/jpeg' || param == 'image/png' || param == 'image/gif') {
    return true;
  }
  return false;
}
