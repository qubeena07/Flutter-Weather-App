import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/repo/weather_repo.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherRepo weatherRepo;
  // WeatherBloc(this.weatherRepo) : super(WeatherNotSearched());
  // @override
  // WeatherState get initialState => WeatherNotSearched();

  // Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
  //   if (event is FetchWeather) {
  //     yield WeatherLoading();
  //     try {
  //       WeatherModel weather = await weatherRepo.getWeather(event._city);
  //       yield WeatherLoaded(weather);
  //     } catch (_) {
  //       print(_);
  //       yield WeatherNotLoaded();
  //     }
  //   } else if (event is ResetWeather) {
  //     yield WeatherNotSearched();
  //   }
  // }
  WeatherBloc({required this.weatherRepo}) : super(WeatherNotSearched()) {
    on<FetchWeather>(_fetchWeather);
    on<ResetWeather>(_resetWeather);
  }

  void _fetchWeather(FetchWeather event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    WeatherModel weather = await weatherRepo.getWeather(event._city);

    emit(WeatherLoaded(weather));
  }

  void _resetWeather(ResetWeather event, Emitter<WeatherState> emit) async {
    emit(WeatherNotSearched());
  }
}
