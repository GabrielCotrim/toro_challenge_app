import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AppTheme {
  AppTheme._();

  static const String appName = "Toro Challenge";

  static final ThemeData _materialTheme = ThemeData();
  static final CupertinoThemeData _cupertinoTheme = CupertinoThemeData();

  static final ThemeData materialTheme = _materialTheme.copyWith(
    primaryColor: Colors.purple.shade800,
    colorScheme: _materialTheme.colorScheme.copyWith(
      secondary: Colors.purple.shade600,
    ),
  );

  static final CupertinoThemeData cupertinoTheme = _cupertinoTheme.copyWith(
    primaryColor: Colors.purple.shade800,
  );
}
