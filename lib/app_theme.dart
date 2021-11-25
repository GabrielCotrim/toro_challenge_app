import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AppTheme {
  AppTheme._();

  static const String appName = "89 FM Joinville";

  static final ThemeData _materialTheme = ThemeData();
  static final CupertinoThemeData _cupertinoTheme = CupertinoThemeData();

  static final ThemeData materialTheme = _materialTheme.copyWith(
    primaryColor: Colors.green.shade800,
    colorScheme: _materialTheme.colorScheme.copyWith(
      secondary: Colors.green.shade600,
    ),
  );

  static final CupertinoThemeData cupertinoTheme = _cupertinoTheme.copyWith(
    primaryColor: Colors.green.shade800,
  );
}
