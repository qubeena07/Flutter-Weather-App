import 'dart:convert';

import 'package:weather_app/model/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherRepo {
  Future<WeatherModel> getWeather(String city) async {
    var url =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&APPID=43ea6baaad7663dc17637e22ee6f78f2";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return parsedJson(response.body);
    } else {
      throw Exception();
    }
  }

  WeatherModel parsedJson(final result) {
    final jsonDecoded = jsonDecode(result);
    final weatherValue = jsonDecoded["main"];
    return WeatherModel.fromJson(weatherValue);
  }
}
