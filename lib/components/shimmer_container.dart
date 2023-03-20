import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../ui_helpers.dart';

class ShimmerContainer extends StatelessWidget {
  final List<Widget> children;
  const ShimmerContainer({
    super.key,
    this.children = const [],
  });
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: paddingStandard,
      child: Shimmer.fromColors(
        baseColor: colorScheme.primary.withAlpha(20),
        highlightColor: colorScheme.primary.withAlpha(40),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: children,
          ),
        ),
      ),
    );
  }
}
