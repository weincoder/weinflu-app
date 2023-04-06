

import 'package:flutter/material.dart';
import 'package:weinflu_app/pages/home_page.dart';

import 'design/themes.dart';

class WeinFluApp extends StatelessWidget{
  const WeinFluApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    theme: WeinFluThemes.defaultTheme,
    home:  const HomePage(key: Key('home page'),),
  );
  }

}