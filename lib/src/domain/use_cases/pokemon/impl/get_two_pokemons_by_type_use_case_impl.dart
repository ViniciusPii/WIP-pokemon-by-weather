import 'dart:math';

import 'package:pokemon_by_weather/src/data/repositories/pokemon/pokemon_repository.dart';
import 'package:pokemon_by_weather/src/domain/entities/pokemon/pokemon_entity.dart';
import 'package:pokemon_by_weather/src/domain/use_cases/pokemon/get_two_pokemons_by_type_use_case.dart';

class GetTwoPokemonsByTypeUseCaseImpl implements GetTwoPokemonsByTypeUseCase {
  GetTwoPokemonsByTypeUseCaseImpl({
    required PokemonRepository repository,
  }) : _repository = repository;

  final PokemonRepository _repository;

  @override
  Future<List<PokemonEntity>> call(String type) async {
    final List<PokemonEntity> pokemons = await _repository.getPokemonUrlDetailsByType(type);

    final List<int> randomIndices = [];

    while (randomIndices.length < 2) {
      final int randomIndex = Random().nextInt(pokemons.length + 1);
      if (!randomIndices.contains(randomIndex)) {
        randomIndices.add(randomIndex);
      }
    }

    final List<PokemonEntity> selectedPokemons = [];

    for (final int randomIndex in randomIndices) {
      selectedPokemons.add(pokemons[randomIndex]);
    }

    return selectedPokemons;
  }
}
