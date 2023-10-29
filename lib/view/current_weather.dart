import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/weather_viewmodel.dart';

class CurrentWeather extends StatefulWidget {
  @override
  _CurrentWeatherState createState() => _CurrentWeatherState();
}

class _CurrentWeatherState extends State<CurrentWeather> {
  WeatherViewModel viewModel = WeatherViewModel();
  String location = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    viewModel = context.read<WeatherViewModel>();
  }

  Future<void> fetchData() async {
    if (location.isNotEmpty) {
      try {
        await viewModel.fetchWeatherData(location);
      } catch (error) {
        print('Error fetching data: $error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final temperatures = context.select((WeatherViewModel viewModel) => viewModel.weatherData);

    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              onChanged: (value) {
                location = value;
              },
              decoration: InputDecoration(labelText: 'Enter Location'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: fetchData,
              child: Text('Fetch Weather'),
            ),
            if (temperatures != null)
              Column(
                children: [
                  Text('Location: ${temperatures.location.name}'),
                  Text('Temperature: ${temperatures.current.tempC}°C'),
                  Text('Condition: ${temperatures.current.condition.text}'),
                ],
              )
            else
              Text('No data available'),
          ],
        ),
      ),
    );
  }
}
