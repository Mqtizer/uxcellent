import 'package:flutter/material.dart';

import '../decorators/input_decoration.dart';

class UXAutoCompleteFormField extends StatelessWidget {
  final String label;
  final String helperText;
  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final TextInputType keyboardType;
  final bool disabled;
  final TextInputAction textInputAction;
  final List<String> options;

  const UXAutoCompleteFormField({
    Key? key,
    required this.label,
    this.helperText = "",
    this.hintText = "",
    required this.controller,
    required this.validator,
    this.keyboardType = TextInputType.multiline,
    this.disabled = false,
    this.textInputAction = TextInputAction.newline,
    this.options = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Autocomplete<String>(
      initialValue: controller.value,
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '' ||
            !textEditingValue.text.contains("{{")) {
          return const Iterable<String>.empty();
        }

        final String text = textEditingValue.text.split("{{").last;
        // restOfText is all text just before the last {{.
        final String restOfText = textEditingValue.text
            .substring(0, textEditingValue.text.lastIndexOf("{{"));

        return options.where((String option) {
          return option.contains(text.toLowerCase());
        }).map((e) => restOfText + e);
      },
      optionsViewBuilder: (BuildContext context,
          AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            color: colorScheme.secondaryContainer,
            elevation: 4.0,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight:
                    options.length * 80 > 400 ? 400.0 : options.length * 80.0,
                maxWidth: MediaQuery.of(context).size.width * 0.9,
              ),
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: options.length,
                itemBuilder: (BuildContext context, int index) {
                  final String option = options.elementAt(index);
                  return ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16.0),
                    title: Text("{{${option.split("{{").last}",
                        style: textTheme.titleMedium!
                            .copyWith(color: colorScheme.onSecondaryContainer)),
                    onTap: () {
                      onSelected(option);
                    },
                  );
                },
              ),
            ),
          ),
        );
      },
      onSelected: (String selection) {
        controller.text = selection;
      },
      fieldViewBuilder: (BuildContext context,
          TextEditingController fieldViewEditingController,
          FocusNode focusNode,
          VoidCallback onFieldSubmitted) {
        return TextFormField(
          controller: fieldViewEditingController,
          focusNode: focusNode,
          onChanged: (string) {
            controller.text = string;
          },
          validator: validator,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          enabled: !disabled,
          minLines: 1,
          maxLines: 10,
          decoration: buildUXInputDecoration(
            context: context,
            labelText: label,
            helperText: helperText,
            hintText: hintText,
            suffixIcon: IconButton(
              icon: Icon(
                Icons.cancel_outlined,
                color: disabled ? Colors.grey[500] : colorScheme.primary,
              ),
              onPressed: disabled
                  ? null
                  : () {
                      controller.clear();
                      fieldViewEditingController.clear();
                    },
            ),
          ),
        );
      },
    );
  }
}
