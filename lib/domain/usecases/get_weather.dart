import '../entities/weather.dart';
import '../repositories/weather_repository.dart';
import '../../core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/error/failure.dart';

class GetWeather implements UseCase<Either<Failure, Weather>, String> {
  final WeatherRepository repository;

  GetWeather(this.repository);

  @override
  Future<Either<Failure, Weather>> call(String cityName) async {
    return await repository.getWeather(cityName);
  }
}
