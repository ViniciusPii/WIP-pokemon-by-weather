import 'package:pokemon_by_weather/src/data/data_sources/pokemon/pokemon_data_source.dart';
import 'package:pokemon_by_weather/src/data/repositories/pokemon/pokemon_repository.dart';
import 'package:pokemon_by_weather/src/domain/entities/pokemon/pokemon_details_entity.dart';
import 'package:pokemon_by_weather/src/domain/entities/pokemon/pokemon_entity.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  PokemonRepositoryImpl({
    required PokemonDataSource dataSource,
  }) : _dataSource = dataSource;

  final PokemonDataSource _dataSource;

  @override
  Future<List<PokemonEntity>> getPokemonUrlDetailsByType(String type) async =>
      await _dataSource.getPokemonUrlDetailsByType(type);

  @override
  Future<PokemonDetailsEntity> getPokemonDetails(String path) async =>
      await _dataSource.getPokemonDetails(path);
}
