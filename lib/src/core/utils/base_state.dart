import 'package:built_collection/built_collection.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/src/core/failure/failures.dart';

class BaseState<T> extends Equatable {
  const BaseState({
    this.data,
    this.failure,
    this.isLoading = false,
  });

  const BaseState.fail(Failure failure)
      : this(
          isLoading: false,
          failure: failure,
        );

  const BaseState.initial({bool isLoading = false})
      : this(
          isLoading: isLoading,
        );

  const BaseState.loaded(T data)
      : this(
          isLoading: false,
          data: data,
        );

  final T? data;
  final Failure? failure;
  final bool isLoading;

  @override
  List<Object?> get props => [data, failure, isLoading];

  @override
  bool get stringify => true;

  @override
  String toString() {
    return '(Data : $data, IsLoading: $isLoading, Failure: $failure)';
  }

  BaseState<T> copyWith({
    T? data,
    Failure? failure,
    bool? isLoading,
  }) {
    return BaseState<T>(
      data: data ?? this.data,
      failure: failure,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class BaseBuiltListState<T> extends Equatable {
  const BaseBuiltListState({
    required this.listData,
    this.failure,
    this.isLoading = false,
  });

  BaseBuiltListState.fail(Failure failure)
      : this(isLoading: false, failure: failure, listData: BuiltList([]));

  // ignore: avoid_unused_constructor_parameters
  factory BaseBuiltListState.initial({bool isLoading = false}) =>
      BaseBuiltListState(listData: BuiltList([]));

  const BaseBuiltListState.loaded(BuiltList<T> listData)
      : this(isLoading: false, listData: listData);

  final Failure? failure;
  final bool isLoading;
  final BuiltList<T> listData;

  @override
  List<Object?> get props => [listData, failure, isLoading];

  @override
  bool get stringify => true;

  @override
  String toString() {
    final length = listData.length;
    return 'Data length: $length ${super.toString()}';
  }

  BaseBuiltListState<T> copyWith({
    BuiltList<T>? listData,
    Failure? failure,
    bool? isLoading,
  }) {
    return BaseBuiltListState<T>(
      listData: listData ?? this.listData,
      failure: failure,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  BaseBuiltListState<T> upsertData(T data) {
    final int indexOfData = listData.indexOf(data);
    if (indexOfData != -1) {
      //Item Match Update
      final BuiltList<T> updatedList =
          listData.rebuild((list) => list[indexOfData] = data);
      return copyWith(listData: updatedList);
    } else {
      //Insert
      final BuiltList<T> updatedList =
          listData.rebuild((list) => list.add(data));
      return copyWith(listData: updatedList);
    }
  }

  bool get hasSuccessData => listData.isNotEmpty && failure == null;
}

class BaseBuiltListStreamState<T> extends Equatable {
  const BaseBuiltListStreamState({required this.listData, this.failure});

  BaseBuiltListStreamState.fail(Failure failure)
      : this(listData: Stream<List<T>>.empty(), failure: failure);

  factory BaseBuiltListStreamState.initial() => BaseBuiltListStreamState(
        listData: Stream<List<T>>.empty(),
      );

  const BaseBuiltListStreamState.loaded(Stream<List<T>> listData)
      : this(listData: listData);

  final Failure? failure;
  final Stream<List<T>> listData;

  @override
  List<Object?> get props => [listData, failure];

  @override
  bool get stringify => true;

  BaseBuiltListStreamState copyWith({
    Stream<List<T>>? listData,
    Failure? failure,
  }) {
    return BaseBuiltListStreamState(
      listData: listData ?? this.listData,
      failure: failure ?? this.failure,
    );
  }

  bool get hasSuccessData => failure == null;
}
