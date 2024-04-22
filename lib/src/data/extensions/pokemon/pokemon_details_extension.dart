import 'package:pokemon_by_weather/src/domain/entities/pokemon/pokemon_details_entity.dart';

extension PokemonDetailsExtension on PokemonDetailsEntity {
  static PokemonDetailsEntity fromMap(Map<String, dynamic> map) {
    return PokemonDetailsEntity(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
    );
  }
}
