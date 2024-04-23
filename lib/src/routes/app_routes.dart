import 'package:flutter/material.dart';
import 'package:pokemon_by_weather/src/domain/enums/pokemon_type.dart';
import 'package:pokemon_by_weather/src/presentation/home/home_pokemon/home_pokemon_page.dart';
import 'package:pokemon_by_weather/src/presentation/pokemon_list/pokemon_list/pokemon_list_page.dart';

class AppRoutes {
  AppRoutes._();

  static String home = '/home';
  static String pokemonList = '/all/pokemons';

  static final Map<String, WidgetBuilder> routes = {
    home: (context) => const HomePokemonPage(),
    pokemonList: (context) {
      final args = ModalRoute.of(context)!.settings.arguments as PokemonType;
      return PokemonListPage(type: args);
    },
  };
}
