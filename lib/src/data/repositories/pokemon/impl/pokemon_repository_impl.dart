import 'package:pokemon_by_weather/src/data/data_sources/pokemon/pokemon_data_source.dart';
import 'package:pokemon_by_weather/src/data/repositories/pokemon/pokemon_repository.dart';
import 'package:pokemon_by_weather/src/domain/entities/pokemon_entity.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  PokemonRepositoryImpl({
    required PokemonDataSource dataSource,
  }) : _dataSource = dataSource;

  final PokemonDataSource _dataSource;

  @override
  Future<List<PokemonEntity>> getPokemonsByType(String type) async =>
      _dataSource.getPokemonsByType(type);
}
