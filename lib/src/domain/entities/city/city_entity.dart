import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:weather_app/src/core/serializers/serializers.dart';

part 'city_entity.g.dart';

abstract class CityEntity implements Built<CityEntity, CityEntityBuilder> {
  factory CityEntity([void Function(CityEntityBuilder) updates]) = _$CityEntity;

  CityEntity._();

  @BuiltValueField(wireName: 'id')
  int? get id;

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

  @BuiltValueField(wireName: 'current')
  bool? get current;

  String toJson() {
    return json.encode(serializers.serializeWith(CityEntity.serializer, this));
  }

  static CityEntity? fromJson(String jsonString) {
    return serializers.deserializeWith(
      CityEntity.serializer,
      json.decode(jsonString),
    );
  }

  Map<String, dynamic> toMap() {
    return serializers.serializeWith(CityEntity.serializer, this)!
        as Map<String, dynamic>;
  }

  static CityEntity? fromMap(Map<String, dynamic>? map) {
    return serializers.deserializeWith(CityEntity.serializer, map);
  }

  static Serializer<CityEntity> get serializer => _$cityEntitySerializer;
}
