import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/model/weather_model.dart';

// ignore: must_be_immutable
class ShowWeather extends StatelessWidget {
  ShowWeather({Key? key, required this.city, required this.weather})
      : super(key: key);
  WeatherModel weather;
  final String city;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          city.toString(),
          style: const TextStyle(
              fontSize: 30, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "${weather.getTemp.round()} 'C",
          style: const TextStyle(
              fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const Text(
          "Temperature",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  "${weather.getMinTemp.round()} 'C",
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const Text(
                  "Min Temprature",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "${weather.getMaxTemp.round()} 'C",
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const Text(
                  "Max Temprature",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ],
            )
          ],
        ),
        const SizedBox(height: 40),
        SizedBox(
            height: 40,
            width: 250,
            child: ElevatedButton(
                onPressed: () {
                  BlocProvider.of<WeatherBloc>(context).add(ResetWeather());
                  log(city.toString());
                },
                child: const Text(
                  "Search",
                  style: TextStyle(fontSize: 20),
                )))
      ],
    );
  }
}
