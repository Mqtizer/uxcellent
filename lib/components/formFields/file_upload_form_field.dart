import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../decorators/input_decoration.dart';

class UXFileUploadFormField extends StatefulWidget {
  final String label;
  final String helperText;
  final List<String> allowedFileTypes;
  final bool disabled;
  final void Function(File)? onFileSelected;

  const UXFileUploadFormField({
    super.key,
    required this.label,
    required this.helperText,
    required this.allowedFileTypes,
    this.disabled = false,
    this.onFileSelected,
  });

  @override
  State<UXFileUploadFormField> createState() => _UXFileUploadFormFieldState();
}

class _UXFileUploadFormFieldState extends State<UXFileUploadFormField> {
  String fileName = "";
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: widget.disabled
          ? null
          : () async {
              final FilePickerResult? result =
                  await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: widget.allowedFileTypes,
                allowCompression: true,
              );
              if (result != null) {
                setState(() {
                  fileName = result.files.first.name;
                });
                if (widget.onFileSelected != null) {
                  widget.onFileSelected!(File(result.paths.first!));
                }
              }
            },
      child: InputDecorator(
        decoration: buildUXInputDecoration(
          context: context,
          labelText: widget.label,
          helperText: widget.helperText,
          disabled: widget.disabled,
          suffixIcon: Icon(
            Icons.file_upload_outlined,
            size: 32.0,
            color: widget.disabled ? Colors.grey[500] : colorScheme.primary,
          ),
        ),
        child: Text(
          fileName,
          style: TextStyle(
            color: widget.disabled ? Colors.grey[500] : colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
