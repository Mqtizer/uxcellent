import 'dart:io';

import 'package:flutter/foundation.dart';

bool get isAndroid => !kIsWeb && Platform.isAndroid;
bool get isIOS => !kIsWeb && Platform.isIOS;
bool get isWindows => !kIsWeb && Platform.isWindows;
bool get isWeb => kIsWeb;

bool get isMobile => isAndroid || isIOS;
