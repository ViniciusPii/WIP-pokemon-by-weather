import 'package:flutter/material.dart';

class PokemonStyle {
  PokemonStyle({
    required this.color,
    required this.icon,
    required this.colorDark,
    required this.colorLight,
    required this.displayName,
  });

  final Color color;
  final String icon;
  final Color colorDark;
  final Color colorLight;
  final String displayName;
}
