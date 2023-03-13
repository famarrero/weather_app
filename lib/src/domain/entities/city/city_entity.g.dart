// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_entity.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CityEntity> _$cityEntitySerializer = new _$CityEntitySerializer();

class _$CityEntitySerializer implements StructuredSerializer<CityEntity> {
  @override
  final Iterable<Type> types = const [CityEntity, _$CityEntity];
  @override
  final String wireName = 'CityEntity';

  @override
  Iterable<Object?> serialize(Serializers serializers, CityEntity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
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
            specifiedType: const FullType(double)));
    }
    value = object.lon;
    if (value != null) {
      result
        ..add('lon')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
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
  CityEntity deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CityEntityBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'lat':
          result.lat = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'lon':
          result.lon = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
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

class _$CityEntity extends CityEntity {
  @override
  final int? id;
  @override
  final String? name;
  @override
  final double? lat;
  @override
  final double? lon;
  @override
  final String? country;
  @override
  final String? state;

  factory _$CityEntity([void Function(CityEntityBuilder)? updates]) =>
      (new CityEntityBuilder()..update(updates))._build();

  _$CityEntity._(
      {this.id, this.name, this.lat, this.lon, this.country, this.state})
      : super._();

  @override
  CityEntity rebuild(void Function(CityEntityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CityEntityBuilder toBuilder() => new CityEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CityEntity &&
        id == other.id &&
        name == other.name &&
        lat == other.lat &&
        lon == other.lon &&
        country == other.country &&
        state == other.state;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
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
    return (newBuiltValueToStringHelper(r'CityEntity')
          ..add('id', id)
          ..add('name', name)
          ..add('lat', lat)
          ..add('lon', lon)
          ..add('country', country)
          ..add('state', state))
        .toString();
  }
}

class CityEntityBuilder implements Builder<CityEntity, CityEntityBuilder> {
  _$CityEntity? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  double? _lat;
  double? get lat => _$this._lat;
  set lat(double? lat) => _$this._lat = lat;

  double? _lon;
  double? get lon => _$this._lon;
  set lon(double? lon) => _$this._lon = lon;

  String? _country;
  String? get country => _$this._country;
  set country(String? country) => _$this._country = country;

  String? _state;
  String? get state => _$this._state;
  set state(String? state) => _$this._state = state;

  CityEntityBuilder();

  CityEntityBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
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
  void replace(CityEntity other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CityEntity;
  }

  @override
  void update(void Function(CityEntityBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CityEntity build() => _build();

  _$CityEntity _build() {
    final _$result = _$v ??
        new _$CityEntity._(
            id: id,
            name: name,
            lat: lat,
            lon: lon,
            country: country,
            state: state);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
