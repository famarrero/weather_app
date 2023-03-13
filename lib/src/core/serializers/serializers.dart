import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:weather_app/src/data/models/city/city_model.dart';
import 'package:weather_app/src/data/models/weather_data/weather_data_model.dart';

part 'serializers.g.dart';

@SerializersFor([
  CityModel,
  WeatherDataModel,
  CoordModel,
  WeatherModel,
  MainModel,
  WindModel,
  SysModel,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(CityModel)]),
        () => ListBuilder<CityModel>(),
      ))
    .build();

// run this when modify this file
// flutter packages pub run build_runner build
