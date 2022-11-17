import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/view/show_weather.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController weatherController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    weatherController.clear();
  }

  DateTime nowDateTime = DateTime.now();
  // String datFormat = nowx

  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue,
              Color.fromARGB(255, 159, 204, 241),
              Colors.blueAccent,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              decoration: const BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage("assets/weather.png"))),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 100,
              width: 135,
              child: Text(
                DateFormat.Hms().format(nowDateTime).toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 30),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if (state is WeatherNotSearched) {
                  return Container(
                    child: Column(
                      children: [
                        const Text(
                          "Search Weather",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextFormField(
                            // textInputAction: TextInputAction.done,
                            onFieldSubmitted: (value) => weatherBloc.add(
                                FetchWeather(
                                    weatherController.text.toString())),
                            textAlign: TextAlign.center,
                            controller: weatherController,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              hintText: "City Name",
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                      color: Colors.black,
                                      style: BorderStyle.solid)),
                            ),
                          ),
                        ),
                        SizedBox(
                            height: 40,
                            width: 250,
                            child: ElevatedButton(
                                onPressed: () {
                                  weatherBloc.add(FetchWeather(
                                      weatherController.text.toString()));
                                  log(weatherController.text.toString(),
                                      name: "city name");
                                },
                                child: const Text(
                                  "Search",
                                  style: TextStyle(fontSize: 20),
                                ))),
                      ],
                    ),
                  );
                } else if (state is WeatherLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is WeatherLoaded) {
                  return ShowWeather(
                      weather: state.getWeather,
                      city: weatherController.text.toString());
                } else {
                  return const Text("Error");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
