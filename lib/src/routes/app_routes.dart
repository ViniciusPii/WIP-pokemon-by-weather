import 'package:flutter/material.dart';
import 'package:pokemon_by_weather/src/presentation/home/home_pokemon/home_pokemon_page.dart';

class AppRoutes {
  AppRoutes._();

  static String home = '/home';

  static final Map<String, WidgetBuilder> routes = {
    home: (context) => const HomePokemonPage(),
  };
}
