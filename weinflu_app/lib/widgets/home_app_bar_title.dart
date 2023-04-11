
import 'package:flutter/material.dart';

import '../design/colors.dart';
class HomeAppBarTitle extends StatelessWidget {
  const HomeAppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
            children: [
              Container(
                width: 40,
                height: 40,
                margin: const EdgeInsets.only(right: 12),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/user.png')),
                    borderRadius: BorderRadius.all(Radius.circular(12))),
              ),
              Expanded(
                child: Text(
                  'Store Name',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              ContainerHeaderIcon(
                  configMargin: const EdgeInsets.only(right: 12),
                  iconButton: IconButton(
                      onPressed: () =>
                          print('presionarion icono notificiaciones'),
                      icon: const Icon(
                        Icons.notifications,
                        color: WeinFluColors.brandPrimaryColor,
                      ))),
              ContainerHeaderIcon(
                  iconButton: IconButton(
                      onPressed: () => print('presionarion icono mas'),
                      icon: const Icon(
                        Icons.more_vert,
                        color: WeinFluColors.brandPrimaryColor,
                      ))),
            ],
          );
  }
}
class ContainerHeaderIcon extends StatelessWidget {
  final IconButton iconButton;
  final EdgeInsets? configMargin;
  const ContainerHeaderIcon(
      {super.key, required this.iconButton, this.configMargin});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      margin: configMargin,
      decoration: BoxDecoration(
          border: Border.all(color: WeinFluColors.brandLightColorBorder),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      child: iconButton,
    );
  }
}
