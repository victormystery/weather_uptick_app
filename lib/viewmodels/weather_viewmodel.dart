import 'package:flutter/material.dart';

import '../models/models.dart';
import '../services/weather_service.dart';

class WeatherViewModel extends ChangeNotifier {
  Temperatures? _weatherData;

  Temperatures? get weatherData => _weatherData;

  Future<void> fetchWeatherData(String location) async {
    try {
      final data = await WeatherService().fetchWeatherData(location);
      _weatherData = data as Temperatures?;
      notifyListeners();
    } catch (e) {
      // Handle error
    }
  }
}
