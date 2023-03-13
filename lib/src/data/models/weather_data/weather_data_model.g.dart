// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_data_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WeatherDataModel> _$weatherDataModelSerializer =
    new _$WeatherDataModelSerializer();
Serializer<CoordModel> _$coordModelSerializer = new _$CoordModelSerializer();
Serializer<WeatherModel> _$weatherModelSerializer =
    new _$WeatherModelSerializer();
Serializer<MainModel> _$mainModelSerializer = new _$MainModelSerializer();
Serializer<WindModel> _$windModelSerializer = new _$WindModelSerializer();
Serializer<CloudsModel> _$cloudsModelSerializer = new _$CloudsModelSerializer();
Serializer<SysModel> _$sysModelSerializer = new _$SysModelSerializer();

class _$WeatherDataModelSerializer
    implements StructuredSerializer<WeatherDataModel> {
  @override
  final Iterable<Type> types = const [WeatherDataModel, _$WeatherDataModel];
  @override
  final String wireName = 'WeatherDataModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, WeatherDataModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.dt;
    if (value != null) {
      result
        ..add('dt')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.dtTxt;
    if (value != null) {
      result
        ..add('dt_txt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.coord;
    if (value != null) {
      result
        ..add('coord')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(CoordModel)));
    }
    value = object.weather;
    if (value != null) {
      result
        ..add('weather')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(WeatherModel)])));
    }
    value = object.base;
    if (value != null) {
      result
        ..add('base')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.main;
    if (value != null) {
      result
        ..add('main')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(MainModel)));
    }
    value = object.visibility;
    if (value != null) {
      result
        ..add('visibility')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.wind;
    if (value != null) {
      result
        ..add('wind')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(WindModel)));
    }
    value = object.clouds;
    if (value != null) {
      result
        ..add('clouds')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(CloudsModel)));
    }
    value = object.sys;
    if (value != null) {
      result
        ..add('sys')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(SysModel)));
    }
    value = object.timezone;
    if (value != null) {
      result
        ..add('timezone')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
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
    return result;
  }

  @override
  WeatherDataModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WeatherDataModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'dt':
          result.dt = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'dt_txt':
          result.dtTxt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'coord':
          result.coord.replace(serializers.deserialize(value,
              specifiedType: const FullType(CoordModel))! as CoordModel);
          break;
        case 'weather':
          result.weather.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(WeatherModel)]))!
              as BuiltList<Object?>);
          break;
        case 'base':
          result.base = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'main':
          result.main.replace(serializers.deserialize(value,
              specifiedType: const FullType(MainModel))! as MainModel);
          break;
        case 'visibility':
          result.visibility = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'wind':
          result.wind.replace(serializers.deserialize(value,
              specifiedType: const FullType(WindModel))! as WindModel);
          break;
        case 'clouds':
          result.clouds.replace(serializers.deserialize(value,
              specifiedType: const FullType(CloudsModel))! as CloudsModel);
          break;
        case 'sys':
          result.sys.replace(serializers.deserialize(value,
              specifiedType: const FullType(SysModel))! as SysModel);
          break;
        case 'timezone':
          result.timezone = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$CoordModelSerializer implements StructuredSerializer<CoordModel> {
  @override
  final Iterable<Type> types = const [CoordModel, _$CoordModel];
  @override
  final String wireName = 'CoordModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, CoordModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.lon;
    if (value != null) {
      result
        ..add('lon')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.lat;
    if (value != null) {
      result
        ..add('lat')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  CoordModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CoordModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'lon':
          result.lon = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'lat':
          result.lat = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
      }
    }

    return result.build();
  }
}

class _$WeatherModelSerializer implements StructuredSerializer<WeatherModel> {
  @override
  final Iterable<Type> types = const [WeatherModel, _$WeatherModel];
  @override
  final String wireName = 'WeatherModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, WeatherModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.main;
    if (value != null) {
      result
        ..add('main')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.icon;
    if (value != null) {
      result
        ..add('icon')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  WeatherModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WeatherModelBuilder();

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
        case 'main':
          result.main = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'icon':
          result.icon = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$MainModelSerializer implements StructuredSerializer<MainModel> {
  @override
  final Iterable<Type> types = const [MainModel, _$MainModel];
  @override
  final String wireName = 'MainModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, MainModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.temp;
    if (value != null) {
      result
        ..add('temp')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.feelsLike;
    if (value != null) {
      result
        ..add('feels_like')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.tempMin;
    if (value != null) {
      result
        ..add('temp_min')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.tempMax;
    if (value != null) {
      result
        ..add('temp_max')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.pressure;
    if (value != null) {
      result
        ..add('pressure')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.humidity;
    if (value != null) {
      result
        ..add('humidity')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.seaLevel;
    if (value != null) {
      result
        ..add('sea_level')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.grndLevel;
    if (value != null) {
      result
        ..add('grnd_level')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  MainModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MainModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'temp':
          result.temp = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'feels_like':
          result.feelsLike = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'temp_min':
          result.tempMin = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'temp_max':
          result.tempMax = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'pressure':
          result.pressure = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'humidity':
          result.humidity = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'sea_level':
          result.seaLevel = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'grnd_level':
          result.grndLevel = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
      }
    }

    return result.build();
  }
}

class _$WindModelSerializer implements StructuredSerializer<WindModel> {
  @override
  final Iterable<Type> types = const [WindModel, _$WindModel];
  @override
  final String wireName = 'WindModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, WindModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.speed;
    if (value != null) {
      result
        ..add('speed')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.deg;
    if (value != null) {
      result
        ..add('deg')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.gust;
    if (value != null) {
      result
        ..add('gust')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  WindModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WindModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'speed':
          result.speed = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'deg':
          result.deg = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'gust':
          result.gust = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
      }
    }

    return result.build();
  }
}

class _$CloudsModelSerializer implements StructuredSerializer<CloudsModel> {
  @override
  final Iterable<Type> types = const [CloudsModel, _$CloudsModel];
  @override
  final String wireName = 'CloudsModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, CloudsModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.all;
    if (value != null) {
      result
        ..add('all')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  CloudsModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CloudsModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'all':
          result.all = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
      }
    }

    return result.build();
  }
}

class _$SysModelSerializer implements StructuredSerializer<SysModel> {
  @override
  final Iterable<Type> types = const [SysModel, _$SysModel];
  @override
  final String wireName = 'SysModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, SysModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.country;
    if (value != null) {
      result
        ..add('country')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sunrise;
    if (value != null) {
      result
        ..add('sunrise')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.sunset;
    if (value != null) {
      result
        ..add('sunset')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  SysModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SysModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'country':
          result.country = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sunrise':
          result.sunrise = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'sunset':
          result.sunset = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$WeatherDataModel extends WeatherDataModel {
  @override
  final int? dt;
  @override
  final String? dtTxt;
  @override
  final CoordModel? coord;
  @override
  final BuiltList<WeatherModel>? weather;
  @override
  final String? base;
  @override
  final MainModel? main;
  @override
  final String? visibility;
  @override
  final WindModel? wind;
  @override
  final CloudsModel? clouds;
  @override
  final SysModel? sys;
  @override
  final int? timezone;
  @override
  final int? id;
  @override
  final String? name;

  factory _$WeatherDataModel(
          [void Function(WeatherDataModelBuilder)? updates]) =>
      (new WeatherDataModelBuilder()..update(updates))._build();

  _$WeatherDataModel._(
      {this.dt,
      this.dtTxt,
      this.coord,
      this.weather,
      this.base,
      this.main,
      this.visibility,
      this.wind,
      this.clouds,
      this.sys,
      this.timezone,
      this.id,
      this.name})
      : super._();

  @override
  WeatherDataModel rebuild(void Function(WeatherDataModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WeatherDataModelBuilder toBuilder() =>
      new WeatherDataModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WeatherDataModel &&
        dt == other.dt &&
        dtTxt == other.dtTxt &&
        coord == other.coord &&
        weather == other.weather &&
        base == other.base &&
        main == other.main &&
        visibility == other.visibility &&
        wind == other.wind &&
        clouds == other.clouds &&
        sys == other.sys &&
        timezone == other.timezone &&
        id == other.id &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, dt.hashCode);
    _$hash = $jc(_$hash, dtTxt.hashCode);
    _$hash = $jc(_$hash, coord.hashCode);
    _$hash = $jc(_$hash, weather.hashCode);
    _$hash = $jc(_$hash, base.hashCode);
    _$hash = $jc(_$hash, main.hashCode);
    _$hash = $jc(_$hash, visibility.hashCode);
    _$hash = $jc(_$hash, wind.hashCode);
    _$hash = $jc(_$hash, clouds.hashCode);
    _$hash = $jc(_$hash, sys.hashCode);
    _$hash = $jc(_$hash, timezone.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WeatherDataModel')
          ..add('dt', dt)
          ..add('dtTxt', dtTxt)
          ..add('coord', coord)
          ..add('weather', weather)
          ..add('base', base)
          ..add('main', main)
          ..add('visibility', visibility)
          ..add('wind', wind)
          ..add('clouds', clouds)
          ..add('sys', sys)
          ..add('timezone', timezone)
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class WeatherDataModelBuilder
    implements Builder<WeatherDataModel, WeatherDataModelBuilder> {
  _$WeatherDataModel? _$v;

  int? _dt;
  int? get dt => _$this._dt;
  set dt(int? dt) => _$this._dt = dt;

  String? _dtTxt;
  String? get dtTxt => _$this._dtTxt;
  set dtTxt(String? dtTxt) => _$this._dtTxt = dtTxt;

  CoordModelBuilder? _coord;
  CoordModelBuilder get coord => _$this._coord ??= new CoordModelBuilder();
  set coord(CoordModelBuilder? coord) => _$this._coord = coord;

  ListBuilder<WeatherModel>? _weather;
  ListBuilder<WeatherModel> get weather =>
      _$this._weather ??= new ListBuilder<WeatherModel>();
  set weather(ListBuilder<WeatherModel>? weather) => _$this._weather = weather;

  String? _base;
  String? get base => _$this._base;
  set base(String? base) => _$this._base = base;

  MainModelBuilder? _main;
  MainModelBuilder get main => _$this._main ??= new MainModelBuilder();
  set main(MainModelBuilder? main) => _$this._main = main;

  String? _visibility;
  String? get visibility => _$this._visibility;
  set visibility(String? visibility) => _$this._visibility = visibility;

  WindModelBuilder? _wind;
  WindModelBuilder get wind => _$this._wind ??= new WindModelBuilder();
  set wind(WindModelBuilder? wind) => _$this._wind = wind;

  CloudsModelBuilder? _clouds;
  CloudsModelBuilder get clouds => _$this._clouds ??= new CloudsModelBuilder();
  set clouds(CloudsModelBuilder? clouds) => _$this._clouds = clouds;

  SysModelBuilder? _sys;
  SysModelBuilder get sys => _$this._sys ??= new SysModelBuilder();
  set sys(SysModelBuilder? sys) => _$this._sys = sys;

  int? _timezone;
  int? get timezone => _$this._timezone;
  set timezone(int? timezone) => _$this._timezone = timezone;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  WeatherDataModelBuilder();

  WeatherDataModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _dt = $v.dt;
      _dtTxt = $v.dtTxt;
      _coord = $v.coord?.toBuilder();
      _weather = $v.weather?.toBuilder();
      _base = $v.base;
      _main = $v.main?.toBuilder();
      _visibility = $v.visibility;
      _wind = $v.wind?.toBuilder();
      _clouds = $v.clouds?.toBuilder();
      _sys = $v.sys?.toBuilder();
      _timezone = $v.timezone;
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WeatherDataModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WeatherDataModel;
  }

  @override
  void update(void Function(WeatherDataModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WeatherDataModel build() => _build();

  _$WeatherDataModel _build() {
    _$WeatherDataModel _$result;
    try {
      _$result = _$v ??
          new _$WeatherDataModel._(
              dt: dt,
              dtTxt: dtTxt,
              coord: _coord?.build(),
              weather: _weather?.build(),
              base: base,
              main: _main?.build(),
              visibility: visibility,
              wind: _wind?.build(),
              clouds: _clouds?.build(),
              sys: _sys?.build(),
              timezone: timezone,
              id: id,
              name: name);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'coord';
        _coord?.build();
        _$failedField = 'weather';
        _weather?.build();

        _$failedField = 'main';
        _main?.build();

        _$failedField = 'wind';
        _wind?.build();
        _$failedField = 'clouds';
        _clouds?.build();
        _$failedField = 'sys';
        _sys?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'WeatherDataModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$CoordModel extends CoordModel {
  @override
  final double? lon;
  @override
  final double? lat;

  factory _$CoordModel([void Function(CoordModelBuilder)? updates]) =>
      (new CoordModelBuilder()..update(updates))._build();

  _$CoordModel._({this.lon, this.lat}) : super._();

  @override
  CoordModel rebuild(void Function(CoordModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CoordModelBuilder toBuilder() => new CoordModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CoordModel && lon == other.lon && lat == other.lat;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, lon.hashCode);
    _$hash = $jc(_$hash, lat.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CoordModel')
          ..add('lon', lon)
          ..add('lat', lat))
        .toString();
  }
}

class CoordModelBuilder implements Builder<CoordModel, CoordModelBuilder> {
  _$CoordModel? _$v;

  double? _lon;
  double? get lon => _$this._lon;
  set lon(double? lon) => _$this._lon = lon;

  double? _lat;
  double? get lat => _$this._lat;
  set lat(double? lat) => _$this._lat = lat;

  CoordModelBuilder();

  CoordModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _lon = $v.lon;
      _lat = $v.lat;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CoordModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CoordModel;
  }

  @override
  void update(void Function(CoordModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CoordModel build() => _build();

  _$CoordModel _build() {
    final _$result = _$v ?? new _$CoordModel._(lon: lon, lat: lat);
    replace(_$result);
    return _$result;
  }
}

class _$WeatherModel extends WeatherModel {
  @override
  final int? id;
  @override
  final String? main;
  @override
  final String? description;
  @override
  final String? icon;

  factory _$WeatherModel([void Function(WeatherModelBuilder)? updates]) =>
      (new WeatherModelBuilder()..update(updates))._build();

  _$WeatherModel._({this.id, this.main, this.description, this.icon})
      : super._();

  @override
  WeatherModel rebuild(void Function(WeatherModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WeatherModelBuilder toBuilder() => new WeatherModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WeatherModel &&
        id == other.id &&
        main == other.main &&
        description == other.description &&
        icon == other.icon;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, main.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, icon.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WeatherModel')
          ..add('id', id)
          ..add('main', main)
          ..add('description', description)
          ..add('icon', icon))
        .toString();
  }
}

class WeatherModelBuilder
    implements Builder<WeatherModel, WeatherModelBuilder> {
  _$WeatherModel? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _main;
  String? get main => _$this._main;
  set main(String? main) => _$this._main = main;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _icon;
  String? get icon => _$this._icon;
  set icon(String? icon) => _$this._icon = icon;

  WeatherModelBuilder();

  WeatherModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _main = $v.main;
      _description = $v.description;
      _icon = $v.icon;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WeatherModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WeatherModel;
  }

  @override
  void update(void Function(WeatherModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WeatherModel build() => _build();

  _$WeatherModel _build() {
    final _$result = _$v ??
        new _$WeatherModel._(
            id: id, main: main, description: description, icon: icon);
    replace(_$result);
    return _$result;
  }
}

class _$MainModel extends MainModel {
  @override
  final double? temp;
  @override
  final double? feelsLike;
  @override
  final double? tempMin;
  @override
  final double? tempMax;
  @override
  final double? pressure;
  @override
  final double? humidity;
  @override
  final double? seaLevel;
  @override
  final double? grndLevel;

  factory _$MainModel([void Function(MainModelBuilder)? updates]) =>
      (new MainModelBuilder()..update(updates))._build();

  _$MainModel._(
      {this.temp,
      this.feelsLike,
      this.tempMin,
      this.tempMax,
      this.pressure,
      this.humidity,
      this.seaLevel,
      this.grndLevel})
      : super._();

  @override
  MainModel rebuild(void Function(MainModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MainModelBuilder toBuilder() => new MainModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MainModel &&
        temp == other.temp &&
        feelsLike == other.feelsLike &&
        tempMin == other.tempMin &&
        tempMax == other.tempMax &&
        pressure == other.pressure &&
        humidity == other.humidity &&
        seaLevel == other.seaLevel &&
        grndLevel == other.grndLevel;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, temp.hashCode);
    _$hash = $jc(_$hash, feelsLike.hashCode);
    _$hash = $jc(_$hash, tempMin.hashCode);
    _$hash = $jc(_$hash, tempMax.hashCode);
    _$hash = $jc(_$hash, pressure.hashCode);
    _$hash = $jc(_$hash, humidity.hashCode);
    _$hash = $jc(_$hash, seaLevel.hashCode);
    _$hash = $jc(_$hash, grndLevel.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MainModel')
          ..add('temp', temp)
          ..add('feelsLike', feelsLike)
          ..add('tempMin', tempMin)
          ..add('tempMax', tempMax)
          ..add('pressure', pressure)
          ..add('humidity', humidity)
          ..add('seaLevel', seaLevel)
          ..add('grndLevel', grndLevel))
        .toString();
  }
}

class MainModelBuilder implements Builder<MainModel, MainModelBuilder> {
  _$MainModel? _$v;

  double? _temp;
  double? get temp => _$this._temp;
  set temp(double? temp) => _$this._temp = temp;

  double? _feelsLike;
  double? get feelsLike => _$this._feelsLike;
  set feelsLike(double? feelsLike) => _$this._feelsLike = feelsLike;

  double? _tempMin;
  double? get tempMin => _$this._tempMin;
  set tempMin(double? tempMin) => _$this._tempMin = tempMin;

  double? _tempMax;
  double? get tempMax => _$this._tempMax;
  set tempMax(double? tempMax) => _$this._tempMax = tempMax;

  double? _pressure;
  double? get pressure => _$this._pressure;
  set pressure(double? pressure) => _$this._pressure = pressure;

  double? _humidity;
  double? get humidity => _$this._humidity;
  set humidity(double? humidity) => _$this._humidity = humidity;

  double? _seaLevel;
  double? get seaLevel => _$this._seaLevel;
  set seaLevel(double? seaLevel) => _$this._seaLevel = seaLevel;

  double? _grndLevel;
  double? get grndLevel => _$this._grndLevel;
  set grndLevel(double? grndLevel) => _$this._grndLevel = grndLevel;

  MainModelBuilder();

  MainModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _temp = $v.temp;
      _feelsLike = $v.feelsLike;
      _tempMin = $v.tempMin;
      _tempMax = $v.tempMax;
      _pressure = $v.pressure;
      _humidity = $v.humidity;
      _seaLevel = $v.seaLevel;
      _grndLevel = $v.grndLevel;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MainModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MainModel;
  }

  @override
  void update(void Function(MainModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MainModel build() => _build();

  _$MainModel _build() {
    final _$result = _$v ??
        new _$MainModel._(
            temp: temp,
            feelsLike: feelsLike,
            tempMin: tempMin,
            tempMax: tempMax,
            pressure: pressure,
            humidity: humidity,
            seaLevel: seaLevel,
            grndLevel: grndLevel);
    replace(_$result);
    return _$result;
  }
}

class _$WindModel extends WindModel {
  @override
  final double? speed;
  @override
  final double? deg;
  @override
  final double? gust;

  factory _$WindModel([void Function(WindModelBuilder)? updates]) =>
      (new WindModelBuilder()..update(updates))._build();

  _$WindModel._({this.speed, this.deg, this.gust}) : super._();

  @override
  WindModel rebuild(void Function(WindModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WindModelBuilder toBuilder() => new WindModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WindModel &&
        speed == other.speed &&
        deg == other.deg &&
        gust == other.gust;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, speed.hashCode);
    _$hash = $jc(_$hash, deg.hashCode);
    _$hash = $jc(_$hash, gust.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WindModel')
          ..add('speed', speed)
          ..add('deg', deg)
          ..add('gust', gust))
        .toString();
  }
}

class WindModelBuilder implements Builder<WindModel, WindModelBuilder> {
  _$WindModel? _$v;

  double? _speed;
  double? get speed => _$this._speed;
  set speed(double? speed) => _$this._speed = speed;

  double? _deg;
  double? get deg => _$this._deg;
  set deg(double? deg) => _$this._deg = deg;

  double? _gust;
  double? get gust => _$this._gust;
  set gust(double? gust) => _$this._gust = gust;

  WindModelBuilder();

  WindModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _speed = $v.speed;
      _deg = $v.deg;
      _gust = $v.gust;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WindModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WindModel;
  }

  @override
  void update(void Function(WindModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WindModel build() => _build();

  _$WindModel _build() {
    final _$result =
        _$v ?? new _$WindModel._(speed: speed, deg: deg, gust: gust);
    replace(_$result);
    return _$result;
  }
}

class _$CloudsModel extends CloudsModel {
  @override
  final double? all;

  factory _$CloudsModel([void Function(CloudsModelBuilder)? updates]) =>
      (new CloudsModelBuilder()..update(updates))._build();

  _$CloudsModel._({this.all}) : super._();

  @override
  CloudsModel rebuild(void Function(CloudsModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CloudsModelBuilder toBuilder() => new CloudsModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CloudsModel && all == other.all;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, all.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CloudsModel')..add('all', all))
        .toString();
  }
}

class CloudsModelBuilder implements Builder<CloudsModel, CloudsModelBuilder> {
  _$CloudsModel? _$v;

  double? _all;
  double? get all => _$this._all;
  set all(double? all) => _$this._all = all;

  CloudsModelBuilder();

  CloudsModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _all = $v.all;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CloudsModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CloudsModel;
  }

  @override
  void update(void Function(CloudsModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CloudsModel build() => _build();

  _$CloudsModel _build() {
    final _$result = _$v ?? new _$CloudsModel._(all: all);
    replace(_$result);
    return _$result;
  }
}

class _$SysModel extends SysModel {
  @override
  final int? type;
  @override
  final int? id;
  @override
  final String? country;
  @override
  final int? sunrise;
  @override
  final int? sunset;

  factory _$SysModel([void Function(SysModelBuilder)? updates]) =>
      (new SysModelBuilder()..update(updates))._build();

  _$SysModel._({this.type, this.id, this.country, this.sunrise, this.sunset})
      : super._();

  @override
  SysModel rebuild(void Function(SysModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SysModelBuilder toBuilder() => new SysModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SysModel &&
        type == other.type &&
        id == other.id &&
        country == other.country &&
        sunrise == other.sunrise &&
        sunset == other.sunset;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, country.hashCode);
    _$hash = $jc(_$hash, sunrise.hashCode);
    _$hash = $jc(_$hash, sunset.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SysModel')
          ..add('type', type)
          ..add('id', id)
          ..add('country', country)
          ..add('sunrise', sunrise)
          ..add('sunset', sunset))
        .toString();
  }
}

class SysModelBuilder implements Builder<SysModel, SysModelBuilder> {
  _$SysModel? _$v;

  int? _type;
  int? get type => _$this._type;
  set type(int? type) => _$this._type = type;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _country;
  String? get country => _$this._country;
  set country(String? country) => _$this._country = country;

  int? _sunrise;
  int? get sunrise => _$this._sunrise;
  set sunrise(int? sunrise) => _$this._sunrise = sunrise;

  int? _sunset;
  int? get sunset => _$this._sunset;
  set sunset(int? sunset) => _$this._sunset = sunset;

  SysModelBuilder();

  SysModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _id = $v.id;
      _country = $v.country;
      _sunrise = $v.sunrise;
      _sunset = $v.sunset;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SysModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SysModel;
  }

  @override
  void update(void Function(SysModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SysModel build() => _build();

  _$SysModel _build() {
    final _$result = _$v ??
        new _$SysModel._(
            type: type,
            id: id,
            country: country,
            sunrise: sunrise,
            sunset: sunset);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
