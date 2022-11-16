part of 'weather_bloc.dart';

@immutable
abstract class WeatherState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class WeatherNotSearched extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final _weather;

  WeatherLoaded(this._weather);
  WeatherModel get getWeather => _weather;
  @override
  List<Object?> get props => [_weather];
}

class WeatherNotLoaded extends WeatherState {}
