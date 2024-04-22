import 'package:pokemon_by_weather/src/domain/entities/pokemon/pokemon_entity.dart';

class _PokemonUtils {
  static String extractPokemonIdFromUrl(String url) {
    final RegExp exp = RegExp(r'/pokemon/(\d+)/?$');

    final Match? match = exp.firstMatch(url);

    if (match != null) {
      return match.group(1)!;
    }

    return '';
  }
}

extension PokemonExtension on PokemonEntity {
  static PokemonEntity fromMap(Map<String, dynamic> map) {
    final url = map['pokemon']['url'] ?? '';
    final id = _PokemonUtils.extractPokemonIdFromUrl(url); // Classe auxiliar
    return PokemonEntity(
      id: id,
      name: map['pokemon']['name'] ?? '',
    );
  }
}
