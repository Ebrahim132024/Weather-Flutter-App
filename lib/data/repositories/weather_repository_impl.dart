import '../../domain/entities/weather.dart';
import '../../domain/repositories/weather_repository.dart';
import '../datasources/weather_remote_data_source.dart';
import '../../core/error/failure.dart';
import 'package:dartz/dartz.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;

  WeatherRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, Weather>> getWeather(String cityName) async {
    try {
      final weather = await remoteDataSource.fetchWeather(cityName);
      return Right(weather);
    } on NotFoundFailure {
      return Left(NotFoundFailure());
    } on ServerFailure {
      return Left(ServerFailure());
    } on NetworkFailure {
      return Left(NetworkFailure());
    } catch (e) {
      return Left(UnexpectedFailure());
    }
  }
}
