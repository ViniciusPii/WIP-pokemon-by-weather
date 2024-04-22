import 'package:pokemon_by_weather/src/domain/entities/pokemon/pokemon_details_entity.dart';
import 'package:pokemon_by_weather/src/domain/entities/pokemon/pokemon_entity.dart';
import 'package:pokemon_by_weather/src/domain/enums/pokemon_type.dart';
import 'package:pokemon_by_weather/src/domain/use_cases/pokemon/get_pokemon_by_city_use_case.dart';
import 'package:pokemon_by_weather/src/domain/use_cases/pokemon/get_pokemon_details_use_case.dart';
import 'package:pokemon_by_weather/src/domain/use_cases/pokemon/get_pokemon_type_by_temp_use_case.dart';
import 'package:pokemon_by_weather/src/domain/use_cases/pokemon/get_pokemons_urls_by_type_use_case.dart';

class GetPokemonByWeatherUseCaseImpl implements GetPokemonByWeatherUseCase {
  GetPokemonByWeatherUseCaseImpl({
    required GetPokemonDetailsUseCase getPokemonDetailsUseCase,
    required GetPokemonTypeByTempUseCase getPokemonTypeByTempUseCase,
    required GetPokemonsUrlsByTypeUseCase getPokemonsUrlsByTypeUseCase,
  })  : _getPokemonDetailsUseCase = getPokemonDetailsUseCase,
        _getPokemonsUrlsByTypeUseCase = getPokemonsUrlsByTypeUseCase,
        _getPokemonTypeByTempUseCase = getPokemonTypeByTempUseCase;

  final GetPokemonDetailsUseCase _getPokemonDetailsUseCase;
  final GetPokemonTypeByTempUseCase _getPokemonTypeByTempUseCase;
  final GetPokemonsUrlsByTypeUseCase _getPokemonsUrlsByTypeUseCase;

  @override
  Future<PokemonDetailsEntity> call(double temp, String condition) async {
    final PokemonType type = _getPokemonTypeByTempUseCase(temp, condition);

    final List<PokemonEntity> pokemonsUrl = await _getPokemonsUrlsByTypeUseCase(type.name);

    final PokemonDetailsEntity pokemon =
        await _getPokemonDetailsUseCase(pokemonsUrl.first.pathDetails);

    return pokemon;
  }
}
