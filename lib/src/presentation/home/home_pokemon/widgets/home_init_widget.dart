import 'package:flutter/material.dart';
import 'package:pokemon_by_weather/src/core/theme/infra/app_dimension.dart';
import 'package:pokemon_by_weather/src/core/ui/components/app_label.dart';
import 'package:pokemon_by_weather/src/core/ui/components/app_title.dart';

class HomeInitWidget extends StatelessWidget {
  const HomeInitWidget({super.key});

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
