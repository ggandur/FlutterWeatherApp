import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/weather.dart';
import 'dart:async';

class CurrentWeatherInfo extends StatefulWidget {
  const CurrentWeatherInfo({Key? key}) : super(key: key);

  @override
  State<CurrentWeatherInfo> createState() => _CurrentWeatherInfoState();
}

class _CurrentWeatherInfoState extends State<CurrentWeatherInfo> {
  Weather weather = Weather("defaultName", "defaultUpdated", 0.00, 0.00, "");
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getWeatherInfo();
  }

  Future getWeatherInfo() async {
    String city = "itajuba";
    String apiKey = "1bf41ec307754debb01115319221104";

    setState(() {
      isLoading = true;
    });

    var response = await http.get(Uri.parse(
        "http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$city&aqi=no"));

    if (response.statusCode == 200) {
      var weatherData = json.decode(response.body);
      weather = Weather.fromJson(weatherData);

      setState(() {
        weatherBox(weather);
        isLoading = false;
      });
    } else {}
    //print(response.body);
  }

  Widget weatherBox(Weather weather) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      Container(
          margin: const EdgeInsets.all(5.0),
          child: Text(weather.name,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 25))),
      Container(
          margin: const EdgeInsets.all(10.0),
          child: Text(
            "${weather.temp_c}°C",
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 55),
          )),
      Image.network("https:" + weather.icon),
      Container(
          margin: const EdgeInsets.only(top: 20.0, bottom: 5.0),
          child: Text(weather.description)),
      Container(
          margin: const EdgeInsets.all(5.0),
          child: Text("Sensação: ${weather.feelslike_c}°C")),
      Container(
          margin: const EdgeInsets.all(5.0),
          child: Text("Atual. ${weather.last_updated}")),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Tempo'),
      ),
      body: Center(child: (weatherBox(weather))),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () {
          getWeatherInfo();
        },
      ),
    );
  }
}
