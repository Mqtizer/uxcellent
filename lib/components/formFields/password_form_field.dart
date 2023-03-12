import 'package:flutter/material.dart';

import '../decorators/input_decoration.dart';

class UXPasswordFormField extends StatefulWidget {
  final String label;
  final String helperText;
  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final List<String>? autofillHints;
  final bool disabled;

  const UXPasswordFormField({
    super.key,
    required this.label,
    required this.helperText,
    this.hintText = "",
    required this.controller,
    required this.validator,
    this.autofillHints,
    this.disabled = false,
  });

  @override
  State<UXPasswordFormField> createState() => _UXPasswordFormFieldState();
}

class _UXPasswordFormFieldState extends State<UXPasswordFormField> {
  bool _obscurePassword = true;

  void togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return TextFormField(
      controller: widget.controller,
      obscureText: _obscurePassword,
      textInputAction: TextInputAction.next,
      decoration: buildUXInputDecoration(
        context: context,
        labelText: widget.label,
        helperText: widget.helperText,
        hintText: widget.hintText,
        disabled: widget.disabled,
        suffixIcon: IconButton(
          icon: Icon(
            _obscurePassword
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: widget.disabled ? Colors.grey[500] : colorScheme.primary,
          ),
          onPressed: widget.disabled
              ? null
              : () {
                  togglePasswordVisibility();
                },
        ),
      ),
      onFieldSubmitted: (_) {
        FocusScope.of(context).nextFocus();
      },
      validator: widget.validator,
      enabled: !widget.disabled,
      autofillHints: widget.autofillHints,
    );
  }
}
