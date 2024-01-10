import 'package:flutter/material.dart';

List<Color> colors = [
  Colors.black,
  Colors.blue.shade200,
  Colors.amber,
  Colors.red.shade300,
];

class AppTheme {
  final int selectColors;
  AppTheme({required this.selectColors})
      : assert(selectColors >= 0, 'SelectColors entre 0 y 3'),
        assert(selectColors < colors.length,
            'Seleccolors menor que ${colors.length}');

  ThemeData getTheme() =>
      ThemeData(useMaterial3: true, colorSchemeSeed: colors[selectColors]);
}
