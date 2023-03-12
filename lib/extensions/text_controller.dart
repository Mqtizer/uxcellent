import 'package:flutter/material.dart';

extension EfficientTextEditingController on TextEditingController {
  void insertAtCursor(String text) {
    final value = this.value;
    final textSelection = value.selection;
    final newText = value.text.replaceRange(
      textSelection.start,
      textSelection.end,
      text,
    );
    this.value = value.copyWith(
      text: newText,
      selection:
          TextSelection.collapsed(offset: textSelection.start + text.length),
    );
  }
}
