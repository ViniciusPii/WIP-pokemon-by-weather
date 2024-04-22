import 'package:pokemon_by_weather/src/data/repositories/pokemon/pokemon_repository.dart';
import 'package:pokemon_by_weather/src/domain/entities/pokemon/pokemon_entity.dart';
import 'package:pokemon_by_weather/src/domain/use_cases/pokemon/get_pokemons_urls_by_type_use_case.dart';

class GetPokemonsUrlsByTypeUseCaseImpl implements GetPokemonsUrlsByTypeUseCase {
  GetPokemonsUrlsByTypeUseCaseImpl({
    required PokemonRepository repository,
  }) : _repository = repository;

  final PokemonRepository _repository;

  @override
  Future<List<PokemonEntity>> call(String type) async =>
      await _repository.getPokemonUrlDetailsByType(type);
}
