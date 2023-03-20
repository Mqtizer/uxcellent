import 'package:flutter_svg/svg.dart';

import 'package:flutter/material.dart';

Widget googleLogo({
  Color color = Colors.white,
  double size = 32,
}) =>
    SvgPicture.asset(
      'assets/social/google.svg',
      semanticsLabel: 'Google Logo',
      package: 'uxcellent',
      width: size,
      height: size,
    );

Widget githubLogo({
  Color color = Colors.white,
  double size = 32,
}) =>
    SvgPicture.asset(
      'assets/social/github.svg',
      semanticsLabel: 'Github Logo',
      package: 'uxcellent',
      width: size,
      height: size,
    );

Widget appleLogo({
  Color color = Colors.white,
  double size = 32,
}) =>
    SvgPicture.asset(
      'assets/social/apple.svg',
      semanticsLabel: 'Apple Logo',
      package: 'uxcellent',
      width: size,
      height: size,
    );
