import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pokemon_by_weather/src/core/theme/app_styles.dart';
import 'package:pokemon_by_weather/src/core/theme/infra/app_dimension.dart';
import 'package:pokemon_by_weather/src/core/ui/components/app_label.dart';
import 'package:pokemon_by_weather/src/core/ui/components/app_title.dart';
import 'package:pokemon_by_weather/src/core/widgets/card_pokemon_widget.dart';
import 'package:pokemon_by_weather/src/core/widgets/full_card_pokemon_widget.dart';
import 'package:pokemon_by_weather/src/presentation/helpers/pokemon/pokemon_helpers.dart';
import 'package:pokemon_by_weather/src/presentation/helpers/weather/weather_helpers.dart';
import 'package:pokemon_by_weather/src/presentation/home/home_pokemon/controller/home_pokemon_state.dart';

class HomeSuccessWidget extends StatelessWidget {
  const HomeSuccessWidget({
    super.key,
    required this.state,
    required this.goToPokemonListAction,
  });

  final HomePokemonSuccessState state;
  final Function goToPokemonListAction;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: AppDimension.extraLarge),
            const AppTitle(title: 'Conseguimos, treinador!'),
            const SizedBox(height: AppDimension.medium),
            const AppLabel(
              label: 'Confira as suas informações e tente capturá-los o mais rápido possível!',
              isCenter: false,
            ),
            const SizedBox(
              height: AppDimension.extraLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      size: AppDimension.large,
                      FontAwesomeIcons.locationDot,
                      color: AppStyles.textColor,
                    ),
                    const SizedBox(
                      width: AppDimension.medium,
                    ),
                    AppLabel(label: state.weather.city)
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      size: AppDimension.large,
                      color: AppStyles.textColor,
                      FontAwesomeIcons.temperatureHigh,
                    ),
                    const SizedBox(
                      width: AppDimension.medium,
                    ),
                    AppLabel(label: '${state.weather.temp.toString()}°')
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      size: AppDimension.large,
                      color: AppStyles.textColor,
                      FontAwesomeIcons.cloudSunRain,
                    ),
                    const SizedBox(
                      width: AppDimension.medium,
                    ),
                    AppLabel(label: state.weather.conditionDisplay)
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      state.type.style.icon,
                      height: AppDimension.big,
                      color: AppStyles.textColor,
                    ),
                    const SizedBox(
                      width: AppDimension.small,
                    ),
                    AppLabel(label: state.type.style.displayName)
                  ],
                ),
              ],
            ),
            const SizedBox(height: AppDimension.extraLarge),
            const AppTitle(
              title: 'Você está prestes a capturar!',
              type: TitleType.medium,
            ),
            const SizedBox(
              height: AppDimension.large,
            ),
            FullCardPokemonWidget(
              type: state.type,
              pokemon: state.pokemonToCatch,
            ),
            const SizedBox(
              height: AppDimension.extraLarge,
            ),
            const AppTitle(
              title: 'Corra! Eles estão fugindo!',
              type: TitleType.medium,
            ),
            const SizedBox(
              height: AppDimension.large,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CardPokemonWidget(
                  type: state.type,
                  pokemon: state.pokemonsRunningAway.first,
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
                  type: state.type,
                  pokemon: state.pokemonsRunningAway.last,
                ),
              ],
            ),
            const SizedBox(
              height: AppDimension.mega,
            ),
            Center(
              child: TextButton(
                onPressed: () => goToPokemonListAction(),
                child: const AppTitle(
                  title: 'Clique e descubra mais!',
                  type: TitleType.small,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
