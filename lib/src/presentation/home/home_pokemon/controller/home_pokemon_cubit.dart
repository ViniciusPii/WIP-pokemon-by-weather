import 'package:bloc/bloc.dart';
import 'package:pokemon_by_weather/src/presentation/home/home_pokemon/controller/home_pokemon_state.dart';

class HomePokemonCubit extends Cubit<HomePokemonState> {
  HomePokemonCubit() : super(const HomePokemonInitialState());
}
