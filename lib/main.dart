import 'package:flutter/material.dart';
import 'package:pokemon_by_weather/src/app.dart';
import 'package:pokemon_by_weather/src/di/app_di.dart';

void main() {
  AppDI.configure();

  runApp(const App());
}
