import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_by_weather/src/core/ui/base_bloc_state.dart';
import 'package:pokemon_by_weather/src/core/ui/components/snack_bar/snack_bar_component.dart';
import 'package:pokemon_by_weather/src/core/ui/components/spacing_page.dart';
import 'package:pokemon_by_weather/src/core/ui/components/three_bounce_component.dart';
import 'package:pokemon_by_weather/src/presentation/home/home_pokemon/controller/home_pokemon_cubit.dart';
import 'package:pokemon_by_weather/src/presentation/home/home_pokemon/controller/home_pokemon_state.dart';
import 'package:pokemon_by_weather/src/presentation/home/widgets/home_header_widget.dart';
import 'package:pokemon_by_weather/src/presentation/home/widgets/home_init_widget.dart';
import 'package:pokemon_by_weather/src/presentation/home/widgets/home_success_widget.dart';

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
                pokemonByCityAction: () => controller.getWeatherByCity(_cityEC.text),
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
                    return HomeSuccessWidget(
                      weather: state.weather,
                      type: state.type,
                      pokemonToCatch: state.pokemonToCatch,
                      pokemonsRunningAway: state.pokemonsRunningAway,
                    );
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
}
