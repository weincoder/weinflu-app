import 'package:flutter/material.dart';
import 'package:weinflu_app/config/app_routes.dart';
import 'package:weinflu_app/config/providers/user_provider.dart';
import 'package:weinflu_app/models/user.dart';
import 'package:weinflu_app/pages/all_transactions.dart';
import 'package:weinflu_app/pages/login_page.dart';
import 'package:weinflu_app/pages/new_page.dart';
import 'package:weinflu_app/pages/other_page.dart';
import 'pages/home_page.dart';
import 'design/themes.dart';

class WeinFluApp extends StatelessWidget {
  const WeinFluApp({super.key});

  @override
  Widget build(BuildContext context) {
    return UserProvider(
      userData: User(name: ''),
      child: MaterialApp(
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
            case AppRoutes.home:
              return MaterialPageRoute(builder: (context) => const HomePage());
            case AppRoutes.allTransactions:
              return MaterialPageRoute(
                  builder: (context) => const AllTransactions());
            case AppRoutes.otherPage:
              return MaterialPageRoute(builder: (context) => const OtherPage());
            default:
              return MaterialPageRoute(builder: (context) => const LogInPage());
          }
        },
      ),
    );
  }
}
