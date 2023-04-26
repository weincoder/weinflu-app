import 'package:flutter/material.dart';
import 'package:weinflu_app/config/app_routes.dart';
import 'package:weinflu_app/models/user.dart';
import 'package:weinflu_app/pages/new_page.dart';
import 'package:weinflu_app/pages/other_page.dart';
import 'pages/home_page.dart';
import 'design/themes.dart';

class WeinFluApp extends StatelessWidget {
  const WeinFluApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: WeinFluThemes.defaultTheme,
      // routes: {
      //   AppRoutes.newPage:(context) => const const ,
      //   AppRoutes.otherPage:(context) => const OtherPage(),
      //   AppRoutes.home:(context) => const HomePage(),
      // },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AppRoutes.newPage:
            return MaterialPageRoute(builder: (context) => const NewPage());
          case AppRoutes.otherPage:
            return MaterialPageRoute(
                builder: (context) =>
                    OtherPage(userData: settings.arguments as User));

          default:
            return MaterialPageRoute(builder: (context) => const HomePage());
        }
      },
    );
  }
}
