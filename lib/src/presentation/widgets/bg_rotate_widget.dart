import 'package:flutter/material.dart';
import 'package:pokemon_by_weather/src/core/theme/infra/app_colors.dart';

class BgRotateWidget extends StatelessWidget {
  const BgRotateWidget({
    super.key,
    required this.size,
    this.color,
  });

  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: const AlwaysStoppedAnimation(35 / 360),
      child: Image.asset(
        'assets/bgpokebola.png',
        height: size,
        color: color ?? AppColors.neutral,
      ),
    );
  }
}
