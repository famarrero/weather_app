import 'package:built_collection/built_collection.dart';
import 'package:dartz/dartz.dart';
import 'package:weather_app/src/core/dio/dio_utils.dart';
import 'package:weather_app/src/core/failure/failures.dart';
import 'package:weather_app/src/data/data_sources/remote/remote_datasource.dart';
import 'package:weather_app/src/data/models/city/city_model.dart';
import 'package:weather_app/src/data/models/weather_data/weather_data_model.dart';
import 'package:weather_app/src/domain/entities/city/city_entity.dart';
import 'package:weather_app/src/domain/repositories/remote_repository.dart';

class RemoteRepositoryImpl implements RemoteRepository {
  const RemoteRepositoryImpl(
    this._remoteDataSource,
  );

  final RemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, BuiltList<CityModel>>> searchCity({
    required String city,
    int? limit = 5,
  }) =>
      safeRequest(
        () => _remoteDataSource.searchCity(city: city, limit: limit),
      );

  @override
  Future<Either<Failure, WeatherDataModel>> getWeatherDataByCityCoord({
    required double lat,
    required double lon,
  }) =>
      safeRequest(
        () => _remoteDataSource.getWeatherDataByCityCoord(lat: lat, lon: lon),
      );

  @override
  Future<Either<Failure, BuiltList<WeatherDataModel>>>
      getFiveDayForeCastByCityCoord({
    required double lat,
    required double lon,
  }) =>
          safeRequest(
            () => _remoteDataSource.getFiveDayForeCastByCityCoord(
              lat: lat,
              lon: lon,
            ),
          );
}
