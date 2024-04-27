import 'package:flutter/material.dart';
import 'package:pokemon_by_weather/src/core/theme/app_styles.dart';
import 'package:pokemon_by_weather/src/core/theme/infra/app_dimension.dart';
import 'package:pokemon_by_weather/src/core/ui/components/app_title.dart';
import 'package:pokemon_by_weather/src/domain/entities/pokemon/pokemon_entity.dart';
import 'package:pokemon_by_weather/src/domain/entities/weather_entity.dart';
import 'package:pokemon_by_weather/src/domain/enums/pokemon_type.dart';
import 'package:pokemon_by_weather/src/presentation/components/card_pokemon_widget.dart';
import 'package:pokemon_by_weather/src/presentation/components/full_card_pokemon_widget.dart';
import 'package:pokemon_by_weather/src/presentation/helpers/weather/weather_helpers.dart';
import 'package:pokemon_by_weather/src/routes/app_routes.dart';

class HomeSuccessWidget extends StatelessWidget {
  const HomeSuccessWidget({
    super.key,
    required this.weather,
    required this.type,
    required this.pokemonToCatch,
    required this.pokemonsRunningAway,
  });

  final WeatherEntity weather;
  final PokemonType type;
  final PokemonEntity pokemonToCatch;
  final List<PokemonEntity> pokemonsRunningAway;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: AppDimension.extraLarge,
            ),
            AppTitle(
              title:
                  'Legal caçador! Você quer caçar em ${weather.city}, por aqui ${weather.conditionDisplay}, e a temperatura está ${weather.temp}º',
            ),
            const SizedBox(
              height: AppDimension.mega,
            ),
            FullCardPokemonWidget(
              type: type,
              pokemon: pokemonToCatch,
            ),
            const SizedBox(
              height: AppDimension.jumbo,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CardPokemonWidget(
                  type: type,
                  pokemon: pokemonsRunningAway.first,
                ),
                const SizedBox(
                  width: AppDimension.extraLarge,
                ),
                const Icon(
                  Icons.compare_arrows_outlined,
                  size: AppDimension.big,
                  color: AppStyles.textColor,
                ),
                const SizedBox(
                  width: AppDimension.extraLarge,
                ),
                CardPokemonWidget(
                  type: type,
                  pokemon: pokemonsRunningAway.last,
                ),
              ],
            ),
            const SizedBox(
              height: AppDimension.extraLarge,
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(
                context,
                AppRoutes.pokemonList,
                arguments: type,
              ),
              child: const Text('Conheça todos pokemons'),
            ),
          ],
        ),
      ),
    );
  }
}
