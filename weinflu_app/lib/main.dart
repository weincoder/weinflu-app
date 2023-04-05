// Importamos el sistema de desiño de Google y todos
// sus componentes reutilizables
import 'package:flutter/material.dart';
import 'package:weinflu_app/design/colors.dart';

//Punto de entrada de la aplicación aqui inicia toda la magia
void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: 'RobotoMono',
      primaryColor: WeinFluColors.brandPrimaryColor,
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
        displayMedium: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        displaySmall: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        headlineLarge: TextStyle(fontSize: 21.0, color: WeinFluColors.brandPrimaryColor),
        bodyLarge: TextStyle(fontSize: 14.0),
        bodyMedium: TextStyle(fontSize: 13.0),
        bodySmall: TextStyle(fontSize: 10.0),
      ),
    ),
    home: Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weinflu App 💙',
        ),
      ),
      body: const Center(
          child: Text(
        'Hola Weincoders 🚀!!!',
      )),
    ),
  ));
}
