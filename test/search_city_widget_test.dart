import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/src/domain/repositories/city_database_repository.dart';
import 'package:weather_app/src/domain/repositories/remote_repository.dart';
import 'package:weather_app/src/presentation/app/lang/l10n.dart';
import 'package:weather_app/src/presentation/pages/search_city_page/search_city_page.dart';

// Mock
class MockRemoteRepository extends Mock implements RemoteRepository {}

class MockCityDatabaseRepository extends Mock
    implements CityDatabaseRepository {}

void main() {
  late MockRemoteRepository mockRemoteRepository;
  late MockCityDatabaseRepository mockCityDatabaseRepository;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
  });
  group('Search City Page Widget Tests', () {
    late Widget widget;

    const Iterable<LocalizationsDelegate> localizationsDelegates = [
      S.delegate,
      GlobalMaterialLocalizations.delegate,
      DefaultCupertinoLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ];

    Future<void> pumpWidget(WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: localizationsDelegates,
          home: widget,
        ),
      );
    }

    setUp(() {
      mockRemoteRepository = MockRemoteRepository();
      mockCityDatabaseRepository = MockCityDatabaseRepository();

      GetIt.I.registerSingleton<RemoteRepository>(mockRemoteRepository);
      GetIt.I.registerSingleton<CityDatabaseRepository>(
        mockCityDatabaseRepository,
      );

      widget = const SearchCityPage();
    });

    testWidgets('Search city page should have search bar', (tester) async {
      // await tester.pumpAndSettle();
      await pumpWidget(tester);
      expect(find.byIcon(Iconsax.search_normal), findsOneWidget);
      expect(find.byType(TextButton), findsOneWidget);
    });

    testWidgets('Search city page should show error with empty search',
        (tester) async {
      // await tester.pumpAndSettle();
      await pumpWidget(tester);
      await tester.tap(find.byType(TextButton));
      await tester.pump();

      expect(find.text(S.current.fieldRequired), findsOneWidget);
    });

    tearDown(() {
      GetIt.I.unregister<RemoteRepository>();
    });
  });
}
