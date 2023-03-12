import 'package:flutter/material.dart';

import '../decorators/input_decoration.dart';

class UXTextFormField extends StatelessWidget {
  final String label;
  final String helperText;
  final String hintText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final TextInputType keyboardType;
  final bool disabled;
  final TextInputAction textInputAction;
  final List<String>? autofillHints;

  const UXTextFormField({
    super.key,
    required this.label,
    required this.helperText,
    this.hintText = "",
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.autofillHints,
    this.disabled = false,
    this.textInputAction = TextInputAction.next,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return TextFormField(
      controller: controller,
      textInputAction: textInputAction,
      maxLines: 50,
      minLines: 1,
      decoration: buildUXInputDecoration(
        context: context,
        labelText: label,
        helperText: helperText,
        hintText: hintText,
        disabled: disabled,
        suffixIcon: IconButton(
          icon: Icon(
            Icons.cancel_outlined,
            color: disabled ? Colors.grey[500] : colorScheme.primary,
          ),
          onPressed: disabled
              ? null
              : () {
                  if (controller != null) {
                    controller!.clear();
                  }
                },
        ),
      ),
      onFieldSubmitted: (_) {
        FocusScope.of(context).nextFocus();
      },
      keyboardType: keyboardType,
      autofillHints: autofillHints,
      validator: validator,
      enabled: !disabled,
    );
  }
}
