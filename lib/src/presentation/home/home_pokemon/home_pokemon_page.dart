import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_by_weather/src/core/theme/app_styles.dart';
import 'package:pokemon_by_weather/src/core/theme/infra/app_dimension.dart';
import 'package:pokemon_by_weather/src/core/ui/base_bloc_state.dart';
import 'package:pokemon_by_weather/src/core/ui/components/app_title.dart';
import 'package:pokemon_by_weather/src/core/ui/components/snack_bar/snack_bar_component.dart';
import 'package:pokemon_by_weather/src/core/ui/components/spacing_page.dart';
import 'package:pokemon_by_weather/src/core/ui/components/three_bounce_component.dart';
import 'package:pokemon_by_weather/src/domain/entities/weather_entity.dart';
import 'package:pokemon_by_weather/src/presentation/components/card_pokemon_widget.dart';
import 'package:pokemon_by_weather/src/presentation/components/full_card_pokemon_widget.dart';
import 'package:pokemon_by_weather/src/presentation/helpers/weather/weather_helpers.dart';
import 'package:pokemon_by_weather/src/presentation/home/home_pokemon/controller/home_pokemon_cubit.dart';
import 'package:pokemon_by_weather/src/presentation/home/home_pokemon/controller/home_pokemon_state.dart';
import 'package:pokemon_by_weather/src/presentation/home/widgets/home_header_widget.dart';
import 'package:pokemon_by_weather/src/presentation/home/widgets/home_init_widget.dart';
import 'package:pokemon_by_weather/src/routes/app_routes.dart';

class HomePokemonPage extends StatefulWidget {
  const HomePokemonPage({super.key});

  @override
  State<HomePokemonPage> createState() => _HomePokemonPageState();
}

class _HomePokemonPageState extends BaseBlocState<HomePokemonPage, HomePokemonCubit> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _cityEC = TextEditingController();

  @override
  void dispose() {
    _cityEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SpacingPage(
          child: Column(
            children: [
              HomeHeaderWidget(
                cityEC: _cityEC,
                action: () => controller.getWeatherByCity(_cityEC.text),
                formKey: _formKey,
              ),
              BlocConsumer<HomePokemonCubit, HomePokemonState>(
                bloc: controller,
                listener: (context, state) {
                  if (state is HomePokemonWeatherErrorState) {
                    return SnackBarComponent.error(context, message: state.message);
                  }

                  if (state is HomePokemonErrorState) {
                    return SnackBarComponent.error(context, message: state.message);
                  }

                  if (state is HomePokemonWeatherNetworkErrorState) {
                    return SnackBarComponent.info(context, message: state.message);
                  }
                },
                builder: (context, state) {
                  if (state is HomePokemonLoadingState) {
                    return const Expanded(
                      child: Center(
                        child: ThreeBounceComponent(),
                      ),
                    );
                  }

                  if (state is HomePokemonSuccessState) {
                    final WeatherEntity weather = state.weather;

                    return _buildSuccess(weather, state, context);
                  }

                  return const HomeInitWidget();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSuccess(
    WeatherEntity weather,
    HomePokemonSuccessState state,
    BuildContext context,
  ) {
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
              type: state.type,
              pokemon: state.pokemonToCatch,
            ),
            const SizedBox(
              height: AppDimension.jumbo,
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
              height: AppDimension.extraLarge,
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(
                context,
                AppRoutes.pokemonList,
                arguments: state.type,
              ),
              child: const Text('Conheça todos pokemons'),
            ),
          ],
        ),
      ),
    );
  }
}
