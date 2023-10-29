import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WeatherService {
  Future<Map<String, dynamic>> fetchWeatherData(String location) async {
    await dotenv.load(fileName: ".env"); // Load the .env file

    final String apiKey = dotenv.env['ApiKey'] ?? ''; // Get the API key

    final String baseUrl = 'https://api.weatherapi.com/v1';

    final response = await http.get(Uri.parse('$baseUrl/current.json?key=$apiKey&q=$location&aqi=no'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
