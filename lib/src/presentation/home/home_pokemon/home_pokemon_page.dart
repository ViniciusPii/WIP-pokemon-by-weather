import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_by_weather/src/core/theme/infra/app_dimension.dart';
import 'package:pokemon_by_weather/src/core/ui/base_bloc_state.dart';
import 'package:pokemon_by_weather/src/core/ui/components/app_label.dart';
import 'package:pokemon_by_weather/src/core/ui/components/app_title.dart';
import 'package:pokemon_by_weather/src/core/ui/components/snack_bar/snack_bar_component.dart';
import 'package:pokemon_by_weather/src/core/ui/components/spacing_page.dart';
import 'package:pokemon_by_weather/src/core/ui/components/three_bounce_component.dart';
import 'package:pokemon_by_weather/src/domain/entities/weather_entity.dart';
import 'package:pokemon_by_weather/src/presentation/home/home_pokemon/controller/home_pokemon_cubit.dart';
import 'package:pokemon_by_weather/src/presentation/home/home_pokemon/controller/home_pokemon_state.dart';

class HomePokemonPage extends StatefulWidget {
  const HomePokemonPage({super.key});

  @override
  State<HomePokemonPage> createState() => _HomePokemonPageState();
}

class _HomePokemonPageState extends BaseBlocState<HomePokemonPage, HomePokemonCubit> {
  final TextEditingController _cityEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SpacingPage(
          child: Column(
            children: [
              _BuildHeader(cityEC: _cityEC, controller: controller),
              BlocConsumer<HomePokemonCubit, HomePokemonState>(
                bloc: controller,
                listener: (context, state) {
                  if (state is HomePokemonCityNotFoundErrorState) {
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

                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: AppDimension.extraLarge,
                          ),
                          AppTitle(
                            title:
                                'Legal caçador! Você quer caçar em ${weather.city}, lá o clima está ${weather.condition}, e a temperatura está ${weather.temp}º',
                          ),
                        ],
                      ),
                    );
                  }

                  return const _BuildInitPage();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BuildInitPage extends StatelessWidget {
  const _BuildInitPage();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height * 0.74,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppDimension.extraLarge),
                  AppTitle(title: 'Está pronto para capturar?!'),
                  SizedBox(height: AppDimension.medium),
                  AppLabel(
                    label:
                        'Procure uma cidade e descubra qual pokemon pode te surpreender! Spoiler!!! As coisas podem mudar por aqui dependendo do clima! Boa Sorte!',
                    isCenter: false,
                  ),
                  SizedBox(height: AppDimension.medium),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: AppDimension.jumbo),
                child: Image.asset(
                  'assets/ash.png',
                  height: 350,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BuildHeader extends StatelessWidget {
  const _BuildHeader({
    required TextEditingController cityEC,
    required this.controller,
  }) : _cityEC = cityEC;

  final TextEditingController _cityEC;
  final HomePokemonCubit controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: AppDimension.large,
        ),
        Image.asset(
          'assets/pokemon_logo.png',
          height: 80,
        ),
        const SizedBox(
          height: AppDimension.extraLarge,
        ),
        Row(
          children: [
            Flexible(
              child: TextFormField(
                controller: _cityEC,
                decoration: InputDecoration(
                  labelText: 'Digite a cidade que deseja caçar!',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: const BorderSide(
                      style: BorderStyle.none,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 11,
                    horizontal: 11,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: AppDimension.medium,
            ),
            SizedBox(
              width: 50,
              child: ElevatedButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  controller.getWeatherByCity(_cityEC.text);
                },
                child: const Icon(Icons.search),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
