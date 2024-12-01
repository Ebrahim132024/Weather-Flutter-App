import '../../domain/entities/weather.dart';

class WeatherModel extends Weather {
  WeatherModel({
    required String cityName,
    required double temperature,
    required String description,
    required String icon,
  }) : super(
    cityName: cityName,
    temperature: temperature,
    description: description,
    icon: icon,
  );

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
    );
  }
}
