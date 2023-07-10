import 'package:flutter/material.dart';

import 'package:flex_color_scheme/flex_color_scheme.dart';

class AppTheme {
  static ThemeData get light => FlexThemeData.light(
        scheme: FlexScheme.indigo,
        useMaterial3: true,
      );

  static ThemeData get dark => FlexThemeData.dark(
        scheme: FlexScheme.indigo,
        useMaterial3: true,
      );
}
