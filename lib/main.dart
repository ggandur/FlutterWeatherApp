import 'package:flutter/material.dart';
import 'currentWeatherInfo.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CurrentWeatherInfo(),
    );
  }
}
