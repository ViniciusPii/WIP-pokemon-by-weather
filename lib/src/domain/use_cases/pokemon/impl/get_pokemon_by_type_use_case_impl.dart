import 'dart:math';

import 'package:pokemon_by_weather/src/data/repositories/pokemon/pokemon_repository.dart';
import 'package:pokemon_by_weather/src/domain/entities/pokemon/pokemon_entity.dart';
import 'package:pokemon_by_weather/src/domain/use_cases/pokemon/get_pokemon_by_type_use_case.dart';

class GetPokemonByTypeUseCaseImpl implements GetPokemonByTypeUseCase {
  GetPokemonByTypeUseCaseImpl({
    required PokemonRepository repository,
  }) : _repository = repository;

  final PokemonRepository _repository;

  @override
  Future<PokemonEntity> call(String type) async {
    final List<PokemonEntity> pokemons = await _repository.getPokemonUrlDetailsByType(type);

    final PokemonEntity pokemon = pokemons[Random().nextInt(pokemons.length + 1)];

    return pokemon;
  }
}
