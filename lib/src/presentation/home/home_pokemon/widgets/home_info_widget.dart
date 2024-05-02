import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pokemon_by_weather/src/core/theme/app_styles.dart';
import 'package:pokemon_by_weather/src/core/theme/infra/app_dimension.dart';
import 'package:pokemon_by_weather/src/core/ui/components/app_label.dart';
import 'package:pokemon_by_weather/src/presentation/helpers/pokemon/pokemon_helpers.dart';
import 'package:pokemon_by_weather/src/presentation/helpers/weather/weather_helpers.dart';
import 'package:pokemon_by_weather/src/presentation/home/home_pokemon/controller/home_pokemon_state.dart';

class HomeInfoWidget extends StatelessWidget {
  const HomeInfoWidget({
    super.key,
    required this.state,
  });

  final HomePokemonSuccessState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ],
    );
  }
}
