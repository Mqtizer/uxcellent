import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

const mqtizerpositive = Color(0xFFA9D475);
const mqtizernegative = Color(0xFFFF5D2D);

CustomColors lightCustomColors = const CustomColors(
  sourceMqtizerpositive: Color(0xFFA9D475),
  mqtizerpositive: Color(0xFF446814),
  onMqtizerpositive: Color(0xFFFFFFFF),
  mqtizerpositiveContainer: Color(0xFFC3F18C),
  onMqtizerpositiveContainer: Color(0xFF102000),
  sourceMqtizernegative: Color(0xFFFF5D2D),
  mqtizernegative: Color(0xFFB12E00),
  onMqtizernegative: Color(0xFFFFFFFF),
  mqtizernegativeContainer: Color(0xFFFFDBD1),
  onMqtizernegativeContainer: Color(0xFF3B0900),
);

CustomColors darkCustomColors = const CustomColors(
  sourceMqtizerpositive: Color(0xFFA9D475),
  mqtizerpositive: Color(0xFFA8D473),
  onMqtizerpositive: Color(0xFF1F3700),
  mqtizerpositiveContainer: Color(0xFF2F4F00),
  onMqtizerpositiveContainer: Color(0xFFC3F18C),
  sourceMqtizernegative: Color(0xFFFF5D2D),
  mqtizernegative: Color(0xFFFFB5A0),
  onMqtizernegative: Color(0xFF601500),
  mqtizernegativeContainer: Color(0xFF872100),
  onMqtizernegativeContainer: Color(0xFFFFDBD1),
);

/// Defines a set of custom colors, each comprised of 4 complementary tones.
///
/// See also:
///   * <https://m3.material.io/styles/color/the-color-system/custom-colors>
@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    required this.sourceMqtizerpositive,
    required this.mqtizerpositive,
    required this.onMqtizerpositive,
    required this.mqtizerpositiveContainer,
    required this.onMqtizerpositiveContainer,
    required this.sourceMqtizernegative,
    required this.mqtizernegative,
    required this.onMqtizernegative,
    required this.mqtizernegativeContainer,
    required this.onMqtizernegativeContainer,
  });

  final Color? sourceMqtizerpositive;
  final Color? mqtizerpositive;
  final Color? onMqtizerpositive;
  final Color? mqtizerpositiveContainer;
  final Color? onMqtizerpositiveContainer;
  final Color? sourceMqtizernegative;
  final Color? mqtizernegative;
  final Color? onMqtizernegative;
  final Color? mqtizernegativeContainer;
  final Color? onMqtizernegativeContainer;

  @override
  CustomColors copyWith({
    Color? sourceMqtizerpositive,
    Color? mqtizerpositive,
    Color? onMqtizerpositive,
    Color? mqtizerpositiveContainer,
    Color? onMqtizerpositiveContainer,
    Color? sourceMqtizernegative,
    Color? mqtizernegative,
    Color? onMqtizernegative,
    Color? mqtizernegativeContainer,
    Color? onMqtizernegativeContainer,
  }) {
    return CustomColors(
      sourceMqtizerpositive:
          sourceMqtizerpositive ?? this.sourceMqtizerpositive,
      mqtizerpositive: mqtizerpositive ?? this.mqtizerpositive,
      onMqtizerpositive: onMqtizerpositive ?? this.onMqtizerpositive,
      mqtizerpositiveContainer:
          mqtizerpositiveContainer ?? this.mqtizerpositiveContainer,
      onMqtizerpositiveContainer:
          onMqtizerpositiveContainer ?? this.onMqtizerpositiveContainer,
      sourceMqtizernegative:
          sourceMqtizernegative ?? this.sourceMqtizernegative,
      mqtizernegative: mqtizernegative ?? this.mqtizernegative,
      onMqtizernegative: onMqtizernegative ?? this.onMqtizernegative,
      mqtizernegativeContainer:
          mqtizernegativeContainer ?? this.mqtizernegativeContainer,
      onMqtizernegativeContainer:
          onMqtizernegativeContainer ?? this.onMqtizernegativeContainer,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      sourceMqtizerpositive:
          Color.lerp(sourceMqtizerpositive, other.sourceMqtizerpositive, t),
      mqtizerpositive: Color.lerp(mqtizerpositive, other.mqtizerpositive, t),
      onMqtizerpositive:
          Color.lerp(onMqtizerpositive, other.onMqtizerpositive, t),
      mqtizerpositiveContainer: Color.lerp(
          mqtizerpositiveContainer, other.mqtizerpositiveContainer, t),
      onMqtizerpositiveContainer: Color.lerp(
          onMqtizerpositiveContainer, other.onMqtizerpositiveContainer, t),
      sourceMqtizernegative:
          Color.lerp(sourceMqtizernegative, other.sourceMqtizernegative, t),
      mqtizernegative: Color.lerp(mqtizernegative, other.mqtizernegative, t),
      onMqtizernegative:
          Color.lerp(onMqtizernegative, other.onMqtizernegative, t),
      mqtizernegativeContainer: Color.lerp(
          mqtizernegativeContainer, other.mqtizernegativeContainer, t),
      onMqtizernegativeContainer: Color.lerp(
          onMqtizernegativeContainer, other.onMqtizernegativeContainer, t),
    );
  }

  /// Returns an instance of [CustomColors] in which the following custom
  /// colors are harmonized with [dynamic]'s [ColorScheme.primary].
  ///   * [CustomColors.sourceMqtizerpositive]
  ///   * [CustomColors.mqtizerpositive]
  ///   * [CustomColors.onMqtizerpositive]
  ///   * [CustomColors.mqtizerpositiveContainer]
  ///   * [CustomColors.onMqtizerpositiveContainer]
  ///   * [CustomColors.sourceMqtizernegative]
  ///   * [CustomColors.mqtizernegative]
  ///   * [CustomColors.onMqtizernegative]
  ///   * [CustomColors.mqtizernegativeContainer]
  ///   * [CustomColors.onMqtizernegativeContainer]
  ///
  /// See also:
  ///   * <https://m3.material.io/styles/color/the-color-system/custom-colors#harmonization>
  CustomColors harmonized(ColorScheme dynamic) {
    return copyWith(
      sourceMqtizerpositive:
          sourceMqtizerpositive!.harmonizeWith(dynamic.primary),
      mqtizerpositive: mqtizerpositive!.harmonizeWith(dynamic.primary),
      onMqtizerpositive: onMqtizerpositive!.harmonizeWith(dynamic.primary),
      mqtizerpositiveContainer:
          mqtizerpositiveContainer!.harmonizeWith(dynamic.primary),
      onMqtizerpositiveContainer:
          onMqtizerpositiveContainer!.harmonizeWith(dynamic.primary),
      sourceMqtizernegative:
          sourceMqtizernegative!.harmonizeWith(dynamic.primary),
      mqtizernegative: mqtizernegative!.harmonizeWith(dynamic.primary),
      onMqtizernegative: onMqtizernegative!.harmonizeWith(dynamic.primary),
      mqtizernegativeContainer:
          mqtizernegativeContainer!.harmonizeWith(dynamic.primary),
      onMqtizernegativeContainer:
          onMqtizernegativeContainer!.harmonizeWith(dynamic.primary),
    );
  }
}
