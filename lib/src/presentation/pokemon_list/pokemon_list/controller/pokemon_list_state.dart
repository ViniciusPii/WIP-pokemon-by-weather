import 'package:pokemon_by_weather/src/domain/entities/pokemon/pokemon_entity.dart';

sealed class PokemonListState {
  const PokemonListState();
}

class PokemonListInitialState extends PokemonListState {
  const PokemonListInitialState();
}

class PokemonListLoadingState extends PokemonListState {
  const PokemonListLoadingState();
}

class PokemonListSuccessState extends PokemonListState {
  const PokemonListSuccessState({required this.pokemons});

  final List<PokemonEntity> pokemons;
}
