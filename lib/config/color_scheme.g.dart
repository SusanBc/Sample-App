import 'package:flutter/material.dart';

ColorScheme lightHighContrastScheme() {
  return const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xff002911),
    surfaceTint: Color(0xff306a43),
    onPrimary: Color(0xffffffff),
    primaryContainer: Color(0xff0f4d29),
    onPrimaryContainer: Color(0xffffffff),
    secondary: Color(0xff142619),
    onSecondary: Color(0xffffffff),
    secondaryContainer: Color(0xff344738),
    onSecondaryContainer: Color(0xffffffff),
    tertiary: Color(0xff00262e),
    onTertiary: Color(0xffffffff),
    tertiaryContainer: Color(0xff1c4952),
    onTertiaryContainer: Color(0xffffffff),
    error: Color(0xff44100c),
    onError: Color(0xffffffff),
    errorContainer: Color(0xff6e302a),
    onErrorContainer: Color(0xffffffff),
    background: Color(0xfff6fbf3),
    onBackground: Color(0xff181d18),
    surface: Color(0xfff6fbf3),
    onSurface: Color(0xff000000),
    surfaceVariant: Color(0xffdde5db),
    onSurfaceVariant: Color(0xff1e261f),
    outline: Color(0xff3d453d),
    outlineVariant: Color(0xff3d453d),
    shadow: Color(0xff000000),
    scrim: Color(0xff000000),
    inverseSurface: Color(0xff2d322d),
    onInverseSurface: Color(0xffffffff),
    inversePrimary: Color(0xffbcfbc9),
  );
}

ColorScheme darkHighContrastScheme() {
  return const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xffefffee),
    surfaceTint: Color(0xff97d5a5),
    onPrimary: Color(0xff000000),
    primaryContainer: Color(0xff9bd9a9),
    onPrimaryContainer: Color(0xff000000),
    secondary: Color(0xffefffee),
    onSecondary: Color(0xff000000),
    secondaryContainer: Color(0xffbbd0bc),
    onSecondaryContainer: Color(0xff000000),
    tertiary: Color(0xfff3fcff),
    onTertiary: Color(0xff000000),
    tertiaryContainer: Color(0xffa6d2dd),
    onTertiaryContainer: Color(0xff000000),
    error: Color(0xfffff9f9),
    onError: Color(0xff000000),
    errorContainer: Color(0xffffbab1),
    onErrorContainer: Color(0xff000000),
    background: Color(0xff101510),
    onBackground: Color(0xffdfe4dc),
    surface: Color(0xff101510),
    onSurface: Color(0xffffffff),
    surfaceVariant: Color(0xff414941),
    onSurfaceVariant: Color(0xfff5fdf2),
    outline: Color(0xffc5cdc3),
    outlineVariant: Color(0xffc5cdc3),
    shadow: Color(0xff000000),
    scrim: Color(0xff000000),
    inverseSurface: Color(0xffdfe4dc),
    onInverseSurface: Color(0xff000000),
    inversePrimary: Color(0xff003216),
  );
}

final lightThemeData = ThemeData(
  colorScheme: lightHighContrastScheme(),
  useMaterial3: true,
);
final darkThemeData = ThemeData(
  colorScheme: darkHighContrastScheme(),
  useMaterial3: true,
);
