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
const Widget verticalSpaceMassive = SizedBox(height: 44);

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
  width: 32,
  thickness: 1,
  indent: 8,
  endIndent: 8,
);

const EdgeInsets screenPaddingStandard = EdgeInsets.fromLTRB(16, 16, 16, 4);
const EdgeInsets screenPaddingTB = EdgeInsets.fromLTRB(0, 16, 0, 4);
const EdgeInsets dialogPaddingStandard = EdgeInsets.fromLTRB(24, 24, 24, 32);
const EdgeInsets dialogPaddingTight = EdgeInsets.fromLTRB(16, 16, 16, 32);
const EdgeInsets safeAreaPadding = EdgeInsets.fromLTRB(16, 48, 16, 8);

const Duration durationStandard = Duration(milliseconds: 200);
const Duration durationFast = Duration(milliseconds: 100);
const Duration durationSlow = Duration(milliseconds: 400);
const Duration durationSlowest = Duration(milliseconds: 800);

const EdgeInsets paddingStandard =
    EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0);

const EdgeInsets paddingStandardMedium =
    EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0);

const EdgeInsets paddingStandardMediumVertical =
    EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0);

const EdgeInsets paddingEqual = EdgeInsets.all(16.0);

const EdgeInsets paddingEqualSmall = EdgeInsets.all(8.0);

const EdgeInsets paddingEqualLarge = EdgeInsets.all(32.0);

const EdgeInsets paddingEqualMassive = EdgeInsets.all(64.0);

const EdgeInsets paddingEqualTiny = EdgeInsets.all(4.0);

const EdgeInsets paddingEqualMedium = EdgeInsets.all(12.0);

const EdgeInsets paddingCard = EdgeInsets.fromLTRB(12, 10, 12, 12);

const EdgeInsets paddingHorizontal = EdgeInsets.symmetric(
  horizontal: 16.0,
);

const EdgeInsets paddingHorizontalMedium = EdgeInsets.symmetric(
  horizontal: 8.0,
);

const EdgeInsets paddingHorizontalSmall = EdgeInsets.symmetric(
  horizontal: 4.0,
);

const EdgeInsets paddingVertical = EdgeInsets.symmetric(
  vertical: 8.0,
);

const EdgeInsets paddingVerticalSmall = EdgeInsets.symmetric(
  vertical: 4.0,
);

const EdgeInsets paddingVerticalLarge = EdgeInsets.symmetric(
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
