import 'package:flutter_svg/svg.dart';

import 'package:flutter/material.dart';

Widget homeIcon({
  Color color = Colors.white,
  double size = 24,
}) =>
    SvgPicture.asset(
      'assets/icons/home.svg',
      semanticsLabel: 'Home',
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      package: 'uxcellent',
      width: size,
      height: size,
    );

Widget homeActiveIcon({
  Color color = Colors.white,
  double size = 24,
}) =>
    SvgPicture.asset(
      'assets/icons/home-active.svg',
      semanticsLabel: 'Home',
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      package: 'uxcellent',
      width: size,
      height: size,
     
    );

Widget templateIcon({
  Color color = Colors.white,
  double size = 24,
}) =>
    SvgPicture.asset(
      'assets/icons/template.svg',
      semanticsLabel: 'Template',
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      package: 'uxcellent',
      width: size,
      height: size,
    );

Widget templateActiveIcon({
  Color color = Colors.white,
  double size = 24,
}) =>
    SvgPicture.asset(
      'assets/icons/template-active.svg',
      semanticsLabel: 'Template',
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      package: 'uxcellent',
      width: size,
      height: size,
    );

Widget learningIcon({
  Color color = Colors.white,
  double size = 24,
}) =>
    SvgPicture.asset(
      'assets/icons/learning.svg',
      semanticsLabel: 'Learning',
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      package: 'uxcellent',
      width: size,
      height: size,
    );

Widget learningActiveIcon({
  Color color = Colors.white,
  double size = 24,
}) =>
    SvgPicture.asset(
      'assets/icons/learning-active.svg',
      semanticsLabel: 'Learning',
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      package: 'uxcellent',
      width: size,
      height: size,
    );
