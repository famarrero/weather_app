part of 'main_cubit.dart';

class MainState extends Equatable {
      
  const MainState({
    required this.isDrawerOpen,
    required this.weatherData,
  });

  factory MainState.initial() => const MainState(
        isDrawerOpen: false,
        weatherData: BaseState.initial(),
      );

  final BaseState<WeatherDataModel> weatherData;

  final bool isDrawerOpen;

  MainState copyWith({
    bool? isDrawerOpen,
    BaseState<WeatherDataModel>? weatherData,
  }) {
    return MainState(
      isDrawerOpen: isDrawerOpen ?? this.isDrawerOpen,
      weatherData: weatherData ?? this.weatherData,
    );
  }

  @override
  List<Object?> get props => [
        isDrawerOpen,
        weatherData,
      ];
}
