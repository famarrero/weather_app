import 'package:flutter/material.dart';
import 'package:weather_app/src/presentation/app/theme/text_styles.dart';

class SideBarTextSeparator extends StatelessWidget {
  const SideBarTextSeparator({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.only(bottom: 5),
      child: Text(
        text,
        style: textStyleBody.copyWith(
            color: Colors.white.withOpacity(0.4), fontSize: 12),
      ),
    );
  }
}
