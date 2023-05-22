import 'package:flutter/material.dart';
import 'package:weinflu_app/design/colors.dart';

class DividerWithText extends StatelessWidget {
  final String title;
  const DividerWithText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children:  [
        const Expanded(
            child: Divider(
          color: WeinFluColors.brandLightColorBorder,
          thickness: 1.0,
        )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Text(title),
        ),
        const Expanded(
            child: Divider(
          color: WeinFluColors.brandLightColorBorder,
          thickness: 1.0,
        )),
      ],
    );
  }
}
