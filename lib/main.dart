import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/screens/weather_screen.dart';
import 'data/datasources/weather_remote_data_source.dart';
import 'data/repositories/weather_repository_impl.dart';
import 'domain/usecases/get_weather.dart';
import 'presentation/bloc/weather_bloc.dart';


void main() {
  final remoteDataSource = WeatherRemoteDataSourceImpl();
  final repository = WeatherRepositoryImpl(remoteDataSource);
  final getWeather = GetWeather(repository);

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => WeatherBloc(getWeather),
        child: WeatherScreen(),
      ),
    ),
  );
}
