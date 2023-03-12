import 'package:flutter/material.dart';

const Widget emptyWidget = SizedBox.shrink();

const Widget horizontalSpaceTiny = SizedBox(width: 4);
const Widget horizontalSpaceSmall = SizedBox(width: 8);
const Widget horizontalSpaceMedium = SizedBox(width: 16);
const Widget horizontalSpaceLarge = SizedBox(width: 32);
const Widget horizontalSpaceMassive = SizedBox(width: 64);

const Widget verticalSpaceTiny = SizedBox(height: 4);
const Widget verticalSpaceSmall = SizedBox(height: 8);
const Widget verticalSpaceMedium = SizedBox(height: 16);
const Widget verticalSpaceLarge = SizedBox(height: 32);
const Widget verticalSpaceMassive = SizedBox(height: 64);

Widget horizontalDividerStandard = Divider(
  color: Colors.grey.shade300,
  height: 32,
  thickness: 0.5,
  indent: 16,
  endIndent: 16,
);

const Widget verticalDivider = VerticalDivider(
  color: Colors.grey,
  width: 1,
  thickness: 1,
  indent: 0,
  endIndent: 0,
);

const EdgeInsets screenPaddingStandard =
    EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0);

const Duration durationStandard = Duration(milliseconds: 200);
