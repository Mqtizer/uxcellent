import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uxcellent/app_platform.dart';

import '../decorators/button_style.dart';
import '../decorators/input_decoration.dart';

class UXSingleSelectOption<T> {
  final T value;
  final Widget label;

  UXSingleSelectOption({
    required this.value,
    required this.label,
  });
}

enum UXSingleSelectFormFieldType {
  radio,
  segmentedButton,
}

class UXSingleSelectFormField<T extends Object> extends StatelessWidget {
  final T value;
  final String label;
  final String helperText;
  final List<UXSingleSelectOption<T>> options;
  final bool disabled;
  final ValueChanged<T> onChanged;
  final UXSingleSelectFormFieldType type;

  const UXSingleSelectFormField({
    super.key,
    required this.value,
    required this.label,
    required this.helperText,
    required this.options,
    this.disabled = false,
    required this.onChanged,
    this.type = UXSingleSelectFormFieldType.segmentedButton,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    return InputDecorator(
      decoration: buildUXInputDecoration(
        context: context,
        labelText: label,
        helperText: helperText,
        disabled: disabled,
        showBorder: !isIOS || type == UXSingleSelectFormFieldType.radio,
        contentPadding: !isIOS || type == UXSingleSelectFormFieldType.radio
            ? null
            : EdgeInsets.zero,
      ),
      child: type == UXSingleSelectFormFieldType.radio
          ? radioGroup(colorScheme, textTheme)
          : isIOS
              ? buildCupertinoSegmentedControl(colorScheme)
              : buildSegmentedButton(colorScheme),
    );
  }

  CupertinoSegmentedControl<T> buildCupertinoSegmentedControl(
          ColorScheme colorScheme) =>
      CupertinoSegmentedControl<T>(
        padding: EdgeInsets.zero,
        groupValue: value,
        selectedColor: disabled ? Colors.grey[500] : colorScheme.primary,
        children: Map.fromEntries(
          options.map(
            (option) => MapEntry(
              option.value,
              option.label,
            ),
          ),
        ),
        onValueChanged: (T? value) {
          if (disabled) return;
          onChanged(
              options.firstWhere((option) => option.value == value).value);
        },
      );

  Widget buildSegmentedButton(ColorScheme colorScheme) {
    return SegmentedButton<T>(
      style: buildUXButtonDecoration(colorScheme, disabled),
      segments: options
          .map(
            (option) => ButtonSegment<T>(
              value: option.value,
              label: option.label,
            ),
          )
          .toList(),
      selected: <T>{value},
      onSelectionChanged: (Set<T> value) {
        if (disabled) return;
        onChanged(value.first);
      },
    );
  }

  Column radioGroup(ColorScheme colorScheme, TextTheme textTheme) {
    return Column(
      children: options
          .map(
            (option) => RadioListTile(
              activeColor: disabled ? Colors.grey[500] : colorScheme.primary,
              groupValue: value,
              value: option.value,
              title: option.label,
              onChanged: (_) {
                if (disabled) return;
                onChanged(option.value);
              },
            ),
          )
          .toList(),
    );
  }
}
