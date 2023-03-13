import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:weather_app/src/presentation/app/lang/l10n.dart';
import 'package:weather_app/src/presentation/app/theme/dimensions.dart';
import 'package:weather_app/src/presentation/components/custom_back_button.dart';
import 'package:weather_app/src/presentation/components/form/normal_form/custom_text_field.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kPagePadding),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: CustomTextField(
                    controller: _searchCityController,
                    hint: S.of(context).searchCity,
                    prefixIcon: Iconsax.search_normal,
                    errorText: _searchCityErrorText,
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Expanded(            
                  child: TextButton(
                    onPressed: () {},
                    child: Text(S.of(context).search),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
