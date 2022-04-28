class Weather {
  String name = "";
  String last_updated = "";
  double temp_c = 0.0;
  double feelslike_c = 0.0;
  String icon = "";
  String description = "";

  Weather(
      this.name, this.last_updated, this.temp_c, this.feelslike_c, this.icon);

  Weather.fromJson(Map<String, dynamic> json) {
    name = json["location"]["name"];
    last_updated = json["current"]["last_updated"];
    temp_c = json["current"]["temp_c"];
    feelslike_c = json["current"]["feelslike_c"];
    icon = json["current"]["condition"]["icon"];
    description = json["current"]["condition"]["text"];
  }
}

// {
//     "location": {
//         "name": "Campinas",
//         "region": "Sao Paulo",
//         "country": "Brazil",
//         "lat": -22.9,
//         "lon": -47.08,
//         "tz_id": "America/Sao_Paulo",
//         "localtime_epoch": 1649869208,
//         "localtime": "2022-04-13 14:00"
//     },
//     "current": {
//         "last_updated_epoch": 1649868300,
//         "last_updated": "2022-04-13 13:45",
//         "temp_c": 26.0,
//         "temp_f": 78.8,
//         "is_day": 1,
//         "condition": {
//             "text": "Partly cloudy",
//             "icon": "//cdn.weatherapi.com/weather/64x64/day/116.png",
//             "code": 1003
//         },
//         "wind_mph": 5.6,
//         "wind_kph": 9.0,
//         "wind_degree": 230,
//         "wind_dir": "SW",
//         "pressure_mb": 1014.0,
//         "pressure_in": 29.94,
//         "precip_mm": 0.5,
//         "precip_in": 0.02,
//         "humidity": 61,
//         "cloud": 50,
//         "feelslike_c": 28.1,
//         "feelslike_f": 82.5,
//         "vis_km": 10.0,
//         "vis_miles": 6.0,
//         "uv": 5.0,
//         "gust_mph": 7.2,
//         "gust_kph": 11.5
//     }
// }