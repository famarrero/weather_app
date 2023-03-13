import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:oktoast/oktoast.dart';
import 'package:weather_app/src/presentation/app/lang/l10n.dart';
import 'package:weather_app/src/presentation/app/theme/colors.dart';
import 'package:weather_app/src/presentation/pages/main_page/components/side_bar/side_bar.dart';
import 'package:weather_app/src/presentation/pages/main_page/cubit/main_cubit.dart';
import 'package:weather_app/src/routes/routes.gr.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  DateTime? _currentBackPressedTime;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(),
      child: Builder(
        builder: (context) {
          return WillPopScope(
            onWillPop: onWillPop,
            child: const MainPageContent(),
          );
        },
      ),
    );
  }

  Future<bool> onWillPop() async {
    final DateTime now = DateTime.now();
    if (_currentBackPressedTime == null ||
        now.difference(_currentBackPressedTime!) > const Duration(seconds: 2)) {
      _currentBackPressedTime = now;
      showToast(
        S.of(context).pressAgainToExit,
        duration: const Duration(seconds: 2),
        position: ToastPosition.bottom,
        backgroundColor: Colors.black.withOpacity(0.7),
      );
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
}

class MainPageContent extends StatelessWidget {
  const MainPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.primaryBlue,
      child: SafeArea(
        child: Scaffold(
          key: context.read<MainCubit>().scaffoldKey,
          drawer: const SideBar(),
          body: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      AutoRouter.of(context)
                          .push(const CitiesManagePageRoute());
                    },
                    icon: const Icon(Iconsax.buliding),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
