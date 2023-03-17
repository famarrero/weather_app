part of 'five_day_forecast_cubit.dart';

class FiveDayForecastState extends Equatable {
  const FiveDayForecastState({
    required this.weathersData,
    required this.orderAsc,
  });

  factory FiveDayForecastState.initial() => FiveDayForecastState(
        weathersData: BaseBuiltListState.initial(),
        orderAsc : false,
      );

  final BaseBuiltListState<WeatherDataModel> weathersData;
  final bool orderAsc;

  FiveDayForecastState copyWith({
    BaseBuiltListState<WeatherDataModel>? weathersData,
    bool? orderAsc,
  }) {
    return FiveDayForecastState(
      weathersData: weathersData ?? this.weathersData,
      orderAsc: orderAsc ?? this.orderAsc,
    );
  }

  @override
  List<Object?> get props => [
        weathersData,
        orderAsc,
      ];
}
