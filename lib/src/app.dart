import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokemon_by_weather/src/core/theme/app_theme.dart';
import 'package:pokemon_by_weather/src/routes/app_routes.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: MaterialApp(
        title: 'Flutter Demo',
        routes: AppRoutes.routes,
        initialRoute: AppRoutes.home,
        theme: AppTheme.defaultTheme,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
