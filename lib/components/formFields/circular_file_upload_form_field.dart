import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../ui_helpers.dart';

class UXCircularFileUploadFormField extends StatelessWidget {
  final List<String> allowedFileTypes;
  final void Function(File) onFileSelected;
  final void Function()? onDismissed;
  final Color? backgroundColor;
  final Color? iconColor;
  final IconData? icon;

  const UXCircularFileUploadFormField({
    super.key,
    required this.allowedFileTypes,
    required this.onFileSelected,
    this.onDismissed,
    this.backgroundColor,
    this.iconColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return IconButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          backgroundColor ?? colorScheme.primaryContainer,
        ),
        padding: MaterialStateProperty.all(paddingStandard),
        shape: MaterialStateProperty.all(
          const CircleBorder(),
        ),
      ),
      icon: Icon(
        icon ?? Icons.camera_alt_outlined,
        size: 32,
        color: iconColor ?? colorScheme.onPrimaryContainer,
      ),
      onPressed: () async {
        final FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: allowedFileTypes,
          allowCompression: true,
        );
        if (result != null) {
          onFileSelected(File(result.paths.first!));
        }
      },
    );
  }
}
