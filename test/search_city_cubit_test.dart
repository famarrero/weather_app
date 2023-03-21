
import 'package:bloc_test/bloc_test.dart';
import 'package:built_collection/built_collection.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/src/core/failure/failures.dart';
import 'package:weather_app/src/core/utils/base_state.dart';
import 'package:weather_app/src/data/models/city/city_model.dart';
import 'package:weather_app/src/domain/repositories/city_database_repository.dart';
import 'package:weather_app/src/domain/repositories/remote_repository.dart';
import 'package:weather_app/src/presentation/pages/search_city_page/cubit/search_city_cubit.dart';

// Mock Cubit
class MockRemoteRepository extends Mock implements RemoteRepository {}

class MockCityDatabaseRepository extends Mock
    implements CityDatabaseRepository {}

void main() {
  late MockRemoteRepository mockRemoteRepository;
  late MockCityDatabaseRepository mockCityDatabaseRepository;
  late SearchCityCubit searchCityCubit;

  group('searchCity test', () {
    setUp(() {
      mockRemoteRepository = MockRemoteRepository();
      mockCityDatabaseRepository = MockCityDatabaseRepository();
      searchCityCubit = SearchCityCubit(
        mockRemoteRepository,
        mockCityDatabaseRepository,
      );
    });

    final BuiltList<CityModel> tCity = BuiltList(<CityModel>[
      CityModel(
        (b) => b
          ..lat = 12.51555
          ..lon = -54.65545
          ..name = 'La Habana'
          ..state = 'La Habana'
          ..country = 'CU',
      ),
      CityModel(
        (b) => b
          ..lat = 12.51555
          ..lon = -54.65545
          ..name = 'New York'
          ..state = 'New York'
          ..country = 'US',
      ),
      CityModel(
        (b) => b
          ..lat = 12.51555
          ..lon = -45.65545
          ..name = 'Toronto'
          ..state = 'Toronto'
          ..country = 'CA',
      ),
    ]);

    const Failure failure = UnknownFailure(message: 'Error ocurred');

    final Either<Failure, BuiltList<CityModel>> okResponse = right(tCity);
    final Either<Failure, BuiltList<CityModel>> failureResponse = left(failure);

    blocTest<SearchCityCubit, SearchCityState>(
      'Search city success',
      setUp: () => when(() => mockRemoteRepository.searchCity(city: 'query'))
          .thenAnswer((_) async => okResponse),
      build: () => searchCityCubit,
      act: (cubit) => cubit.getFoundCities('query'),
      expect: () => <SearchCityState>[
        SearchCityState(
          foundCities: BaseBuiltListState<CityModel>(
            listData: BuiltList(<CityModel>[]),
            failure: null,
            isLoading: true,
          ),
          insertCityInDB: const BaseState.initial(),
          message: null,
        ),
        SearchCityState(
          foundCities: BaseBuiltListState<CityModel>(
            listData: tCity,
            failure: null,
            isLoading: false,
          ),
          insertCityInDB: const BaseState.initial(),
          message: null,
        ),
      ],
      verify: (_) async {
        verify(() => mockRemoteRepository.searchCity(city: 'query')).called(1);
      },
    );

    blocTest<SearchCityCubit, SearchCityState>(
      'Search city failure',
      setUp: () => when(() => mockRemoteRepository.searchCity(city: 'query'))
          .thenAnswer((_) async => failureResponse),
      build: () => searchCityCubit,
      act: (cubit) => cubit.getFoundCities('query'),
      expect: () => <SearchCityState>[
        SearchCityState(
          foundCities: BaseBuiltListState<CityModel>(
            listData: BuiltList(<CityModel>[]),
            failure: null,
            isLoading: true,
          ),
          insertCityInDB: const BaseState.initial(),
          message: null,
        ),
        SearchCityState(
          foundCities: BaseBuiltListState<CityModel>(
            listData: BuiltList(<CityModel>[]),
            failure: failure,
            isLoading: false,
          ),
          insertCityInDB: const BaseState.initial(),
          message: null,
        ),
      ],
      verify: (_) async {
        verify(() => mockRemoteRepository.searchCity(city: 'query')).called(1);
      },
    );
  });
}
