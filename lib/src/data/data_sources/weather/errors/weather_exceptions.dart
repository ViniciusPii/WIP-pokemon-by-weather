class WeatherException {
  WeatherException({
    this.title,
    this.message,
  });

  final String? title;
  final String? message;
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
