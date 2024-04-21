class WeatherException {
  WeatherException({
    required this.message,
  });

  final String message;
}

class WeatherNotFoundException {
  WeatherNotFoundException({
    required this.message,
  });

  final String message;
}

class WeatherNetworkException {
  WeatherNetworkException({
    required this.message,
  });

  final String message;
}
