import 'package:pokemon_by_weather/src/data/repositories/pokemon/pokemon_repository.dart';
import 'package:pokemon_by_weather/src/domain/entities/pokemon/pokemon_details_entity.dart';
import 'package:pokemon_by_weather/src/domain/use_cases/pokemon/get_pokemon_details_use_case.dart';

class GetPokemonDetailsUseCaseImpl implements GetPokemonDetailsUseCase {
  GetPokemonDetailsUseCaseImpl({
    required PokemonRepository repository,
  }) : _repository = repository;

  final PokemonRepository _repository;

  @override
  Future<PokemonDetailsEntity> call(String path) async => await _repository.getPokemonDetails(path);
}
