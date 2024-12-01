import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_weather.dart';
import '../../domain/entities/weather.dart';
import 'package:dartz/dartz.dart';
import '../../core/error/failure.dart';

abstract class WeatherEvent {}
class FetchWeatherEvent extends WeatherEvent {
  final String cityName;
  FetchWeatherEvent(this.cityName);
}

abstract class WeatherState {}
class WeatherInitial extends WeatherState {}
class WeatherLoading extends WeatherState {}
class WeatherLoaded extends WeatherState {
  final Weather weather;
  WeatherLoaded(this.weather);
}
class WeatherError extends WeatherState {
  final String message;
  WeatherError(this.message);
}

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeather getWeather;

  WeatherBloc(this.getWeather) : super(WeatherInitial()) {
    on<FetchWeatherEvent>((event, emit) async {
      emit(WeatherLoading());
      final failureOrWeather = await getWeather(event.cityName);
      failureOrWeather.fold(
            (failure) => emit(WeatherError(failure.message)),
            (weather) => emit(WeatherLoaded(weather)),
      );
    });
  }
}
