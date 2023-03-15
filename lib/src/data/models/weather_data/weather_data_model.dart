import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:weather_app/src/core/serializers/serializers.dart';

part 'weather_data_model.g.dart';

abstract class WeatherDataModel
    implements Built<WeatherDataModel, WeatherDataModelBuilder> {
  factory WeatherDataModel([void Function(WeatherDataModelBuilder) updates]) =
      _$WeatherDataModel;

  WeatherDataModel._();

  @BuiltValueField(wireName: 'dt')
  int? get dt;

  @BuiltValueField(wireName: 'dt_txt')
  String? get dtTxt;

  @BuiltValueField(wireName: 'coord')
  CoordModel? get coord;

  @BuiltValueField(wireName: 'weather')
  BuiltList<WeatherModel>? get weather;

  @BuiltValueField(wireName: 'base')
  String? get base;

  @BuiltValueField(wireName: 'main')
  MainModel? get main;

  @BuiltValueField(wireName: 'visibility')
  double? get visibility;

  @BuiltValueField(wireName: 'wind')
  WindModel? get wind;

  @BuiltValueField(wireName: 'clouds')
  CloudsModel? get clouds; 

  @BuiltValueField(wireName: 'sys')
  SysModel? get sys;

  @BuiltValueField(wireName: 'timezone')
  int? get timezone;

  @BuiltValueField(wireName: 'id')
  int? get id;

  @BuiltValueField(wireName: 'name')
  String? get name;

  String toJson() {
    return json
        .encode(serializers.serializeWith(WeatherDataModel.serializer, this));
  }

  static WeatherDataModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
      WeatherDataModel.serializer,
      json.decode(jsonString),
    );
  }

  Map<String, dynamic> toMap() {
    return serializers.serializeWith(WeatherDataModel.serializer, this)!
        as Map<String, dynamic>;
  }

  static WeatherDataModel? fromMap(Map<String, dynamic>? map) {
    return serializers.deserializeWith(WeatherDataModel.serializer, map);
  }

  static Serializer<WeatherDataModel> get serializer =>
      _$weatherDataModelSerializer;
}

abstract class CoordModel implements Built<CoordModel, CoordModelBuilder> {
  factory CoordModel([void Function(CoordModelBuilder) updates]) = _$CoordModel;

  CoordModel._();

  @BuiltValueField(wireName: 'lon')
  double? get lon;

  @BuiltValueField(wireName: 'lat')
  double? get lat;

  static Serializer<CoordModel> get serializer => _$coordModelSerializer;
}

abstract class WeatherModel
    implements Built<WeatherModel, WeatherModelBuilder> {
  factory WeatherModel([void Function(WeatherModelBuilder) updates]) =
      _$WeatherModel;

  WeatherModel._();

  @BuiltValueField(wireName: 'id')
  int? get id;

  @BuiltValueField(wireName: 'main')
  String? get main;

  @BuiltValueField(wireName: 'description')
  String? get description;

  @BuiltValueField(wireName: 'icon')
  String? get icon;

  static Serializer<WeatherModel> get serializer =>
      _$weatherModelSerializer;
}

abstract class MainModel implements Built<MainModel, MainModelBuilder> {
  factory MainModel([void Function(MainModelBuilder) updates]) = _$MainModel;

  MainModel._();

  @BuiltValueField(wireName: 'temp')
  double? get temp;

  @BuiltValueField(wireName: 'feels_like')
  double? get feelsLike;

  @BuiltValueField(wireName: 'temp_min')
  double? get tempMin;

  @BuiltValueField(wireName: 'temp_max')
  double? get tempMax;

  @BuiltValueField(wireName: 'pressure')
  double? get pressure;

  @BuiltValueField(wireName: 'humidity')
  double? get humidity;

  @BuiltValueField(wireName: 'sea_level')
  double? get seaLevel;

  @BuiltValueField(wireName: 'grnd_level')
  double? get grndLevel;

  static Serializer<MainModel> get serializer => _$mainModelSerializer;
}

abstract class WindModel implements Built<WindModel, WindModelBuilder> {
  factory WindModel([void Function(WindModelBuilder) updates]) = _$WindModel;

  WindModel._();

  @BuiltValueField(wireName: 'speed')
  double? get speed;

  @BuiltValueField(wireName: 'deg')
  double? get deg;

  @BuiltValueField(wireName: 'gust')
  double? get gust;

  static Serializer<WindModel> get serializer => _$windModelSerializer;
}

abstract class CloudsModel implements Built<CloudsModel, CloudsModelBuilder> {
  factory CloudsModel([void Function(CloudsModelBuilder) updates]) =
      _$CloudsModel;

  CloudsModel._();

  @BuiltValueField(wireName: 'all')
  double? get all;

  static Serializer<CloudsModel> get serializer => _$cloudsModelSerializer;
}

abstract class SysModel implements Built<SysModel, SysModelBuilder> {
  factory SysModel([void Function(SysModelBuilder) updates]) = _$SysModel;

  SysModel._();

  @BuiltValueField(wireName: 'type')
  int? get type;

  @BuiltValueField(wireName: 'id')
  int? get id;

  @BuiltValueField(wireName: 'country')
  String? get country;

  @BuiltValueField(wireName: 'sunrise')
  int? get sunrise;

  @BuiltValueField(wireName: 'sunset')
  int? get sunset;

  static Serializer<SysModel> get serializer => _$sysModelSerializer;
}
