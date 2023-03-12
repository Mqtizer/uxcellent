import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../decorators/input_decoration.dart';

class UXFileUploadFormField extends StatelessWidget {
  final String label;
  final String helperText;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final List<String> allowedFileTypes;
  final bool disabled;
  final void Function(FilePickerResult)? onFileSelected;

  const UXFileUploadFormField({
    super.key,
    required this.label,
    required this.helperText,
    required this.controller,
    required this.validator,
    required this.allowedFileTypes,
    this.disabled = false,
    this.onFileSelected,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return FormField<String>(
        validator: validator,
        builder: (formFieldState) {
          return GestureDetector(
            onTap: disabled
                ? null
                : () async {
                    final FilePickerResult? result =
                        await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowedExtensions: allowedFileTypes,
                    );
                    if (result != null) {
                      controller.text = result.paths.first ?? "";
                      if (onFileSelected != null) onFileSelected!(result);
                    }
                  },
            child: InputDecorator(
              decoration: buildUXInputDecoration(
                context: context,
                labelText: label,
                helperText: helperText,
                disabled: disabled,
                errorText: formFieldState.errorText,
                suffixIcon: Icon(
                  Icons.file_upload_outlined,
                  size: 32.0,
                  color: disabled ? Colors.grey[500] : colorScheme.primary,
                ),
              ),
              child: Text(
                controller.text,
                style: TextStyle(
                  color: disabled ? Colors.grey[500] : colorScheme.primary,
                ),
              ),
            ),
          );
        });

    // return TextFormField(
    //   decoration: buildInputDecoration(
    //     context: context,
    //     labelText: label,
    //     helperText: helperText,
    //     disabled: disabled,
    //     suffixIcon: IconButton(
    //       icon: Icon(
    //         Icons.file_upload_outlined,
    //         size: 32.0,
    //         color: disabled ? Colors.grey[500] : colorScheme.primary,
    //       ),
    //       onPressed: disabled
    //           ? null
    //           : () async {
    //               final FilePickerResult? result =
    //                   await FilePicker.platform.pickFiles(
    //                 type: FileType.custom,
    //                 allowedExtensions: allowedFileTypes,
    //               );
    //               if (result != null) {
    //                 controller.text = result.paths.first ?? "";
    //                 if (onFileSelected != null) onFileSelected!(result);
    //               }
    //             },
    //     ),
    //   ),
    //   controller: controller,
    //   enabled: !disabled,
    //   validator: validator,
    // );
  }
}
