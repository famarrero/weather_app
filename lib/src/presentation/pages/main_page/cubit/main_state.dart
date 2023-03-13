part of 'main_cubit.dart';

class MainState extends Equatable {
  const MainState({
    required this.isDrawerOpen,
  });

  factory MainState.initial() => const MainState(
        isDrawerOpen: false,
      );

  final bool isDrawerOpen;

  MainState copyWith({bool? isDrawerOpen}) {
    return MainState(
      isDrawerOpen: isDrawerOpen ?? this.isDrawerOpen,
    );
  }

  @override
  List<Object?> get props => [isDrawerOpen];
}
