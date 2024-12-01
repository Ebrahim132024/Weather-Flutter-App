import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:weather_app/core/error/failure.dart';
import 'dart:convert';


import '../models/weather_model.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> fetchWeather(String cityName);
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final String apiKey = 'bd624576a648c4f1422c049733f18de5';

  @override
  Future<WeatherModel> fetchWeather(String cityName) async {
    try{
      final url =
          'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        log(response.body);
        log(response.statusCode.toString());
        final data = json.decode(response.body);
        return WeatherModel.fromJson(data);
      } else {
        final Map<String, dynamic> errorData = json.decode(response.body);
        if (errorData['cod'] == '404') {
          throw NotFoundFailure();
        }
        throw ServerFailure();

      }
    } on SocketException {
      throw NetworkFailure();
    }

  }
}
