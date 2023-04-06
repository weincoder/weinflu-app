import 'package:flutter/material.dart';
import 'package:weinflu_app/design/colors.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return   Row(
            children: [
              Container(
                height: 40,
                width: 40,
                margin: const EdgeInsets.only(right: 12),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/user.png'))),
              ),
              Expanded(
                child: Text(
                  'Store Name',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    border: Border.all(color: WeinFluColors.brandPrimaryColor),
                    borderRadius: BorderRadius.circular(12)),
                child: IconButton(
                  icon: const Icon(
                    Icons.notifications,
                    color: WeinFluColors.brandPrimaryColor,
                  ),
                  onPressed: () {
                    print('hola mundo');
                  },
                ),
              ),
              Container(
                height: 40,
                width: 40,
                margin: const EdgeInsets.only(left: 12),
                decoration: BoxDecoration(
                    border: Border.all(color: WeinFluColors.brandPrimaryColor),
                    borderRadius: BorderRadius.circular(12)),
                child: IconButton(
                  icon: const Icon(
                    Icons.more_vert,
                    color: WeinFluColors.brandPrimaryColor,
                  ),
                  onPressed: () {
                    print('hola mundo more');
                  },
                ),
              )
            ],
          );
  }
}