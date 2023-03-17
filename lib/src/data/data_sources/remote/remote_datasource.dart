import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:weather_app/src/core/dio/dio_client.dart';
import 'package:weather_app/src/core/serializers/serializers.dart';
import 'package:weather_app/src/data/models/city/city_model.dart';
import 'package:weather_app/src/data/models/weather_data/weather_data_model.dart';

abstract class RemoteDataSource {
  Future<BuiltList<CityModel>?> searchCity({
    required String city,
    int? limit = 5,
  });

  Future<WeatherDataModel?> getWeatherDataByCityCoord({
    required double lat,
    required double lon,
  });

  Future<BuiltList<WeatherDataModel>?> getFiveDayForeCastByCityCoord({
    required double lat,
    required double lon,
  });
}

class RemoteDataSourceImpl implements RemoteDataSource {
  const RemoteDataSourceImpl(this._dioClient);

  final DioHttpClient _dioClient;

  @override
  Future<BuiltList<CityModel>?> searchCity({
    required String city,
    int? limit = 5,
  }) async {
    final response = await _dioClient.dio.get<List<dynamic>>(
      '/geo/1.0/direct',
      queryParameters: <String, dynamic>{
        'q': city,
        'limit': limit,
      },
    );

    return serializers.deserialize(
      response.data,
      specifiedType: const FullType(BuiltList, [FullType(CityModel)]),
    ) as BuiltList<CityModel>?;
  }

  @override
  Future<WeatherDataModel?> getWeatherDataByCityCoord({
    required double lat,
    required double lon,
  }) async {
    final response = await _dioClient.dio.post<Map<String, dynamic>>(
      '/data/2.5/weather',
      queryParameters: <String, dynamic>{
        'lat': lat,
        'lon': lon,
        'units': 'metric'
      },
    );

    return WeatherDataModel.fromMap(response.data);
  }

  @override
  Future<BuiltList<WeatherDataModel>?> getFiveDayForeCastByCityCoord({
    required double lat,
    required double lon,
  }) async {
    final response = await _dioClient.dio.get<Map<String, dynamic>>(
      '/data/2.5/forecast',
      queryParameters: <String, dynamic>{
        'lat': lat,
        'lon': lon,
        'cnt': 35,
        'units': 'metric'
      },
    );

    return serializers.deserialize(
      response.data?['list'],
      specifiedType: const FullType(BuiltList, [FullType(WeatherDataModel)]),
    ) as BuiltList<WeatherDataModel>?;
  }
}
