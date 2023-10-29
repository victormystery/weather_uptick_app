import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/weather_viewmodel.dart';
import 'view/current_weather.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => WeatherViewModel(),
        child: CurrentWeather(),
      ),
    );
  }
}
