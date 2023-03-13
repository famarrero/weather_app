import 'package:built_collection/built_collection.dart';
import 'package:dartz/dartz.dart';
import 'package:weather_app/src/core/failure/failures.dart';
import 'package:weather_app/src/data/models/city/city_model.dart';
import 'package:weather_app/src/data/models/weather_data/weather_data_model.dart';

abstract class RemoteRepository {
  Future<Either<Failure, BuiltList<CityModel>>> searchCity({
    required String city,
    int? limit = 5,
  });

  Future<Either<Failure, WeatherDataModel>> getWeatherDataByCityCoord({
    required double lat,
    required double lon,
  });

  Future<Either<Failure, BuiltList<WeatherDataModel>?>>
      getFiveDayForeCastByCityCoord({
    required double lat,
    required double lon,
  });
}
