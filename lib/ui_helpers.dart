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

const Widget horizontalDividerStandard = Divider(
  height: 32,
  thickness: 0.5,
  indent: 16,
  endIndent: 16,
);

const Widget horizontalDividerSmall = Divider(
  height: 24,
  thickness: 0.5,
  indent: 24,
  endIndent: 24,
);

const Widget horizontalDividerMedium = Divider(
  height: 48,
  thickness: 1,
  indent: 16,
  endIndent: 16,
);

const Widget verticalDivider = VerticalDivider(
  width: 1,
  thickness: 1,
  indent: 0,
  endIndent: 0,
);

const EdgeInsets screenPaddingStandard =
    EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0);

const Duration durationStandard = Duration(milliseconds: 200);
const Duration durationFast = Duration(milliseconds: 100);
const Duration durationSlow = Duration(milliseconds: 400);
const Duration durationSlowest = Duration(milliseconds: 800);

const EdgeInsetsGeometry paddingStandard =
    EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0);

const EdgeInsetsGeometry paddingCard = EdgeInsets.fromLTRB(12, 10, 12, 12);

const EdgeInsetsGeometry paddingHorizontal = EdgeInsets.symmetric(
  horizontal: 16.0,
);

const EdgeInsetsGeometry paddingHorizontalMedium = EdgeInsets.symmetric(
  horizontal: 8.0,
);

const EdgeInsetsGeometry paddingHorizontalSmall = EdgeInsets.symmetric(
  horizontal: 4.0,
);

const EdgeInsetsGeometry paddingVertical = EdgeInsets.symmetric(
  vertical: 8.0,
);

const EdgeInsetsGeometry paddingVerticalSmall = EdgeInsets.symmetric(
  vertical: 4.0,
);

const EdgeInsetsGeometry paddingVerticalLarge = EdgeInsets.symmetric(
  vertical: 16.0,
);

const RoundedRectangleBorder roundShapeStandard = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(Radius.circular(8.0)),
);

const RoundedRectangleBorder roundShapeSmall = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(Radius.circular(4.0)),
);

const RoundedRectangleBorder roundShapeLarge = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(Radius.circular(16.0)),
);

const BorderRadius borderRadiusStandard = BorderRadius.all(
  Radius.circular(8.0),
);

const BorderRadius borderRadiusSmall = BorderRadius.all(
  Radius.circular(4.0),
);

const BorderRadius borderRadiusLarge = BorderRadius.all(
  Radius.circular(16.0),
);
