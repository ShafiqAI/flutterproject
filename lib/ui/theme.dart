import 'package:flutter/material.dart';

ThemeData buildTheme() {
  TextTheme _buildTextTheme(TextTheme base) {
    return base.copyWith(
      headline1: base.headline1.copyWith(
        fontFamily: 'Merriweather',
        fontSize: 40.0,
        color: Colors.white,
      ),
    );
  }

  final ThemeData base = ThemeData.light();

  return base.copyWith(
    textTheme: _buildTextTheme(base.textTheme),
  );
}
