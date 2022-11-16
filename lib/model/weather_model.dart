class WeatherModel {
  final temp;
  final feelsLike;
  final tempMin;
  final tempMax;
  final pressure;
  final humidity;

  // double? temp;
  // double? feelsLike;
  // double? tempMin;
  // double? tempMax;
  // int? pressure;
  // int? humidity;
  double get getTemp => temp - 272.5;
  double get getMaxTemp => tempMax - 272.5;
  double get getMinTemp => tempMin - 272.5;

  WeatherModel({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        temp: (json['temp'] as num?)?.toDouble(),
        feelsLike: (json['feels_like'] as num?)?.toDouble(),
        tempMin: (json['temp_min'] as num?)?.toDouble(),
        tempMax: (json['temp_max'] as num?)?.toDouble(),
        pressure: json['pressure'] as int?,
        humidity: json['humidity'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'temp': temp,
        'feels_like': feelsLike,
        'temp_min': tempMin,
        'temp_max': tempMax,
        'pressure': pressure,
        'humidity': humidity,
      };
}
