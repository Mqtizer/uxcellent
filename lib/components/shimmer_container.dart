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
    return Padding(
      padding: paddingStandard,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[400]!,
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
