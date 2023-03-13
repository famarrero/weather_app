import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:weather_app/src/core/serializers/serializers.dart';

part 'city_model.g.dart';

abstract class CityModel implements Built<CityModel, CityModelBuilder> {
  factory CityModel([void Function(CityModelBuilder) updates]) = _$CityModel;

  CityModel._();

  @BuiltValueField(wireName: 'name')
  String? get name;

  @BuiltValueField(wireName: 'lat')
  double? get lat;

  @BuiltValueField(wireName: 'lon')
  double? get lon;

  @BuiltValueField(wireName: 'country')
  String? get country;

  @BuiltValueField(wireName: 'state')
  String? get state;

  String toJson() {
    return json.encode(serializers.serializeWith(CityModel.serializer, this));
  }

  static CityModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
      CityModel.serializer,
      json.decode(jsonString),
    );
  }

  Map<String, dynamic> toMap() {
    return serializers.serializeWith(CityModel.serializer, this)!
        as Map<String, dynamic>;
  }

  static CityModel? fromMap(Map<String, dynamic>? map) {
    return serializers.deserializeWith(CityModel.serializer, map);
  }

  static Serializer<CityModel> get serializer => _$cityModelSerializer;
}
