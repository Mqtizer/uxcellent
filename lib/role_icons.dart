import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RoleIcons {
  final String name;
  final String path;

  const RoleIcons(this.name, this.path);

  Widget getSvgImage({
    Color color = Colors.white,
    double size = 24,
  }) =>
      SvgPicture.asset(
        path,
        semanticsLabel: name,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        package: 'uxcellent',
        width: size,
        height: size,
      );

  @override
  String toString() {
    return name;
  }
}

List<RoleIcons> roleIcons = [
  const RoleIcons('Person', 'assets/roleIcons/person.svg'),
  const RoleIcons('SecuredPerson', 'assets/roleIcons/secured_person.svg'),
  const RoleIcons('Pending', 'assets/roleIcons/pending.svg'),
];

RoleIcons getRoleIconFromName(String? name) {
  return roleIcons.firstWhere((element) => element.name == name,
      orElse: () => roleIcons[0]);
}
