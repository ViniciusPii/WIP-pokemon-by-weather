import 'package:pokemon_by_weather/src/domain/entities/pokemon/pokemon_entity.dart';

abstract class PokemonRepository {
  Future<List<PokemonEntity>> getPokemonUrlDetailsByType(String type);
}
