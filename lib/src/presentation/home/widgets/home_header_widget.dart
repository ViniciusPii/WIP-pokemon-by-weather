import 'package:flutter/material.dart';
import 'package:pokemon_by_weather/src/core/theme/infra/app_dimension.dart';
import 'package:validatorless/validatorless.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({
    super.key,
    required this.cityEC,
    required this.formKey,
    required this.pokemonByCityAction,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController cityEC;
  final Function() pokemonByCityAction;

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
        Form(
          key: formKey,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: TextFormField(
                  controller: cityEC,
                  validator: Validatorless.multiple(
                    [
                      Validatorless.required('Campo obrigatório'),
                      Validatorless.regex(
                        RegExp(r'^[A-Za-záàâãéèêẽíìîĩóòôõúùûũüçÇs\s]+$'),
                        'Apenas caracteres!',
                      )
                    ],
                  ),
                  decoration: InputDecoration(
                    labelText: 'Digite a cidade que deseja caçar!',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: const BorderSide(
                        style: BorderStyle.none,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 12,
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
                height: 44,
                child: ElevatedButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();

                    if (formKey.currentState!.validate()) {
                      pokemonByCityAction();
                    }
                  },
                  child: const Icon(Icons.search),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
