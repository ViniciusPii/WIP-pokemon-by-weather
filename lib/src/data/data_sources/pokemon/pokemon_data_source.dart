import 'package:pokemon_by_weather/src/domain/entities/pokemon_entity.dart';

abstract class PokemonDataSource {
  Future<List<PokemonEntity>> getPokemonsByType(String type);
}
