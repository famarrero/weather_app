// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CityModel> _$cityModelSerializer = new _$CityModelSerializer();

class _$CityModelSerializer implements StructuredSerializer<CityModel> {
  @override
  final Iterable<Type> types = const [CityModel, _$CityModel];
  @override
  final String wireName = 'CityModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, CityModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lat;
    if (value != null) {
      result
        ..add('lat')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lon;
    if (value != null) {
      result
        ..add('lon')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.country;
    if (value != null) {
      result
        ..add('country')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.state;
    if (value != null) {
      result
        ..add('state')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  CityModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CityModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'lat':
          result.lat = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'lon':
          result.lon = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'country':
          result.country = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'state':
          result.state = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$CityModel extends CityModel {
  @override
  final String? name;
  @override
  final String? lat;
  @override
  final String? lon;
  @override
  final String? country;
  @override
  final String? state;

  factory _$CityModel([void Function(CityModelBuilder)? updates]) =>
      (new CityModelBuilder()..update(updates))._build();

  _$CityModel._({this.name, this.lat, this.lon, this.country, this.state})
      : super._();

  @override
  CityModel rebuild(void Function(CityModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CityModelBuilder toBuilder() => new CityModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CityModel &&
        name == other.name &&
        lat == other.lat &&
        lon == other.lon &&
        country == other.country &&
        state == other.state;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, lat.hashCode);
    _$hash = $jc(_$hash, lon.hashCode);
    _$hash = $jc(_$hash, country.hashCode);
    _$hash = $jc(_$hash, state.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CityModel')
          ..add('name', name)
          ..add('lat', lat)
          ..add('lon', lon)
          ..add('country', country)
          ..add('state', state))
        .toString();
  }
}

class CityModelBuilder implements Builder<CityModel, CityModelBuilder> {
  _$CityModel? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _lat;
  String? get lat => _$this._lat;
  set lat(String? lat) => _$this._lat = lat;

  String? _lon;
  String? get lon => _$this._lon;
  set lon(String? lon) => _$this._lon = lon;

  String? _country;
  String? get country => _$this._country;
  set country(String? country) => _$this._country = country;

  String? _state;
  String? get state => _$this._state;
  set state(String? state) => _$this._state = state;

  CityModelBuilder();

  CityModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _lat = $v.lat;
      _lon = $v.lon;
      _country = $v.country;
      _state = $v.state;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CityModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CityModel;
  }

  @override
  void update(void Function(CityModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CityModel build() => _build();

  _$CityModel _build() {
    final _$result = _$v ??
        new _$CityModel._(
            name: name, lat: lat, lon: lon, country: country, state: state);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
