import 'package:simple_weather_app/models/current_weather_api_model.dart';

abstract class WeatherApi {
  Future<Weather> getWeather();
}
