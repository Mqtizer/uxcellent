import 'package:flutter_svg/svg.dart';

import 'package:flutter/material.dart';

Widget mqtizerLogo({
  Color color = Colors.white,
  double size = 32,
}) =>
    SvgPicture.asset(
      'assets/mqtizer_logo_org.svg',
      semanticsLabel: 'Mqtizer Logo',
      package: 'uxcellent',
      width: size,
      height: size,
    );
