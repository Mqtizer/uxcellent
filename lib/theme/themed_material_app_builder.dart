import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_schemes.dart';
import 'custom_color.dart';
import 'text_theme.dart';
import 'widget_themes/button_themes.dart';
import 'widget_themes/tile_theme.dart';

class UXTheme extends StatelessWidget {
  final bool isMaterialYou;
  final ThemeMode themeMode;
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey;
  final RouterConfig<Object> routerConfig;
  final Iterable<Locale>? supportedLocales;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final Locale? locale;

  const UXTheme({
    super.key,
    this.isMaterialYou = false,
    this.themeMode = ThemeMode.system,
    required this.scaffoldMessengerKey,
    required this.routerConfig,
    this.supportedLocales,
    this.localizationsDelegates,
    this.locale,
  });

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (
        ColorScheme? lightDynamic,
        ColorScheme? darkDynamic,
      ) {
        ColorScheme lightScheme;
        ColorScheme darkScheme;
        if (lightDynamic != null && darkDynamic != null && isMaterialYou) {
          lightScheme = lightDynamic.harmonized();
          darkScheme = darkDynamic.harmonized();
        } else {
          // Otherwise, use fallback schemes.
          lightScheme = lightColorScheme;
          darkScheme = darkColorScheme;
        }

        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          scaffoldMessengerKey: scaffoldMessengerKey,
          localizationsDelegates: localizationsDelegates,
          locale: locale,
          supportedLocales:
              supportedLocales ?? const <Locale>[Locale('en', 'US')],
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: lightScheme,
            scaffoldBackgroundColor: lightScheme.background,
            extensions: [lightCustomColors],
            textTheme: textTheme,
            bottomAppBarTheme: bottomAppBarTheme,
            floatingActionButtonTheme: floatingActionButtonTheme(lightScheme),
            elevatedButtonTheme: elevatedButtonTheme(lightScheme),
            outlinedButtonTheme: outlinedButtonTheme(lightScheme),
            textButtonTheme: textButtonTheme(lightScheme),
            listTileTheme: listTileTheme(lightScheme, textTheme),
            dividerColor: lightScheme.onSurface.withOpacity(0.12),
            cupertinoOverrideTheme:
                cupertinoStyle(Brightness.light, lightScheme),
            // canvasColor: lightScheme.secondaryContainer.withAlpha(120),
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: darkScheme,
            extensions: [darkCustomColors],
            scaffoldBackgroundColor: darkScheme.background,
            textTheme: textTheme,
            bottomAppBarTheme: bottomAppBarTheme,
            floatingActionButtonTheme: floatingActionButtonTheme(darkScheme),
            elevatedButtonTheme: elevatedButtonTheme(darkScheme),
            outlinedButtonTheme: outlinedButtonTheme(darkScheme),
            textButtonTheme: textButtonTheme(darkScheme),
            listTileTheme: listTileTheme(darkScheme, textTheme),
            dividerColor: darkScheme.secondaryContainer.withAlpha(120),
            cupertinoOverrideTheme: cupertinoStyle(Brightness.dark, darkScheme),
          ),
          themeMode: themeMode,
          routerConfig: routerConfig,
        );
      },
    );
  }

  CupertinoThemeData cupertinoStyle(
      Brightness brightness, ColorScheme colorScheme) {
    return CupertinoThemeData(
      brightness: brightness,
      primaryColor: colorScheme.primary,
      primaryContrastingColor: colorScheme.onPrimary,
      barBackgroundColor: colorScheme.surface,
      scaffoldBackgroundColor: colorScheme.background,
      applyThemeToAll: true,
      textTheme: CupertinoTextThemeData(
        textStyle: GoogleFonts.nunito(),
        navTitleTextStyle: TextStyle(
          color: colorScheme.onSurface,
          fontSize: 16,
        ),
        primaryColor: colorScheme.primary,
        navLargeTitleTextStyle: TextStyle(
          color: colorScheme.onSurface,
          fontSize: 24,
        ),
        navActionTextStyle: TextStyle(
          color: colorScheme.onSurface,
          fontSize: 16,
        ),
        actionTextStyle: TextStyle(
          color: colorScheme.onSurface,
          fontSize: 16,
        ),
      ),
    );
  }
}

const bottomAppBarTheme = BottomAppBarTheme(
  // elevation: 0.0,
  shape: CircularNotchedRectangle(),
  // padding: EdgeInsets.all(0.0),
  // height: 80.0,
);
