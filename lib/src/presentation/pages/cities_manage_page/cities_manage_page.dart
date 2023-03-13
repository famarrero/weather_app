import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:weather_app/src/presentation/app/lang/l10n.dart';
import 'package:weather_app/src/presentation/app/theme/dimensions.dart';
import 'package:weather_app/src/presentation/components/custom_back_button.dart';
import 'package:weather_app/src/presentation/components/form/form_decoration.dart';
import 'package:weather_app/src/presentation/components/form/normal_form/custom_text_field.dart';
import 'package:weather_app/src/routes/routes.gr.dart';

class CitiesManagePage extends StatefulWidget {
  const CitiesManagePage({Key? key}) : super(key: key);

  @override
  State<CitiesManagePage> createState() => _CitiesManagePageState();
}

class _CitiesManagePageState extends State<CitiesManagePage> {
  @override
  void initState() {
    super.initState();
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
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              borderRadius: BorderRadius.circular(kCorner),
              onTap: () {
                AutoRouter.of(context).push(const SearchCityPageRoute());
              },
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.6),
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(kCorner),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Icon(
                        Iconsax.search_normal,
                        color: Colors.grey.withOpacity(0.9),
                      ),
                      const SizedBox(
                        width: 14.0,
                      ),
                      Text(
                        S.of(context).searchCity,
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontSize: 16,
                              color: Colors.grey.withOpacity(0.9),
                            ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
