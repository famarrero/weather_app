import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:weather_app/src/core/utils/react_to_failure_snackbar.dart';
import 'package:weather_app/src/injector.dart';
import 'package:weather_app/src/presentation/app/lang/l10n.dart';
import 'package:weather_app/src/presentation/app/theme/dimensions.dart';
import 'package:weather_app/src/presentation/components/custom_back_button.dart';
import 'package:weather_app/src/presentation/components/failure_widget.dart';
import 'package:weather_app/src/presentation/components/form/normal_form/custom_text_field.dart';
import 'package:weather_app/src/presentation/components/loading.dart';
import 'package:weather_app/src/presentation/pages/search_city_page/components/city_tile.dart';
import 'package:weather_app/src/presentation/pages/search_city_page/cubit/search_city_cubit.dart';

class SearchCityPage extends StatefulWidget {
  const SearchCityPage({Key? key}) : super(key: key);

  @override
  State<SearchCityPage> createState() => _SearchCityPageState();
}

class _SearchCityPageState extends State<SearchCityPage> {
  late TextEditingController _searchCityController;
  String? _searchCityErrorText;

  @override
  void initState() {
    _searchCityController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchCityController.dispose();
    super.dispose();
  }

  void _getFoundCities(BuildContext context) {
    if (_searchCityController.text.isEmpty) {
      setState(() {
        _searchCityErrorText = S.of(context).fieldRequired;
      });
    } else {
      FocusScope.of(context).unfocus();
      context
          .read<SearchCityCubit>()
          .getFoundCities(_searchCityController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: const CustomBackButton(),
          ),
          body: BlocProvider(
            create: (context) => SearchCityCubit(
              injector(),
              injector(),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kPagePadding),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 4,
                        child: CustomTextField(                          
                          controller: _searchCityController,
                          autofocus: true,
                          hint: S.of(context).searchCity,
                          prefixIcon: Iconsax.search_normal,
                          errorText: _searchCityErrorText,
                          onChanged: (value) {
                            setState(() {
                              _searchCityErrorText = null;
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Builder(
                        builder: (context) {
                          return Expanded(
                            child: TextButton(
                              onPressed: () => _getFoundCities(context),
                              child: Text(S.of(context).search),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                  const SizedBox(height: 24.0),
                  Expanded(
                    child: BlocConsumer<SearchCityCubit, SearchCityState>(
                      listener: (context, state) {
                        if (state.insertCityInDB.failure != null) {
                          context.reactToFailureWithSnackBar(
                            failure: state.insertCityInDB.failure,
                          );
                        }
                        if (state.insertCityInDB.data == true) {
                          Navigator.of(context).pop();
                        }
                      },
                      builder: (context, state) {
                        if (state.foundCities.isLoading) {
                          return const SizedBox(
                            height: 200.0,
                            child: CustomCircularLoadingIndicator(),
                          );
                        } else if (state.foundCities.failure != null) {
                          return FailureWidget(
                            iconData: Iconsax.warning_2,
                            title: S.of(context).errorOcurred,
                            failure: state.foundCities.failure,
                            retry: () => _getFoundCities(context),
                          );
                        } else if (state.foundCities.hasSuccessData) {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: state.foundCities.listData.length,
                            itemBuilder: (context, index) {
                              final city = state.foundCities.listData[index];
                              return CityTile(
                                city: city,
                              );
                            },
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
