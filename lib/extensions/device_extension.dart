import 'package:flutter/material.dart';

extension DeviceDataContext on BuildContext {
  bool get isTablet => MediaQuery.of(this).size.shortestSide > 600;
  bool get isPhone => MediaQuery.of(this).size.shortestSide < 600;
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  bool get isLandscape =>
      MediaQuery.of(this).orientation == Orientation.landscape;
  bool get isPortrait =>
      MediaQuery.of(this).orientation == Orientation.portrait;

  bool get isKeyboardVisible => MediaQuery.of(this).viewInsets.bottom > 0;
  // hide keyboard
  void hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
