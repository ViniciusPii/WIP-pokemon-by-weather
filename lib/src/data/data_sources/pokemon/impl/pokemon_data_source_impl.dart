import 'package:pokemon_by_weather/src/app_env.dart';
import 'package:pokemon_by_weather/src/core/external/app_client_response.dart';
import 'package:pokemon_by_weather/src/core/external/http_service.dart';
import 'package:pokemon_by_weather/src/data/data_sources/pokemon/errors/pokemon_exceptions.dart';
import 'package:pokemon_by_weather/src/data/data_sources/pokemon/pokemon_data_source.dart';
import 'package:pokemon_by_weather/src/data/extensions/pokemon/pokemon_extension.dart';
import 'package:pokemon_by_weather/src/domain/entities/pokemon/pokemon_entity.dart';

class PokemonDataSourceImpl implements PokemonDataSource {
  PokemonDataSourceImpl({
    required HttpService http,
  }) : _http = http;

  final HttpService _http;

  @override
  Future<List<PokemonEntity>> getPokemonUrlDetailsByType(String type) async {
    try {
      final String baseUrl = '/type/$type';

      final AppClientResponse response = await _http.get('${AppEnv.pokeBaseUrl}$baseUrl');

      final List<PokemonEntity> pokemons = (response.data['pokemon'] as List)
          .map((pokemon) => PokemonExtension.fromMap(pokemon))
          .toList();

      final List<PokemonEntity> pokemonWithoutMegaEvolution =
          pokemons.where((pokemon) => int.parse(pokemon.id) < 10000).toList();

      return pokemonWithoutMegaEvolution;
    } catch (e) {
      throw PokemonException(message: 'Ops! Algo deu errado! Tente novamente mais tarde!');
    }
  }
}
