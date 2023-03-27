// Importamos el sistema de desiño de Google y todos
// sus componentes reutilizables
import 'package:flutter/material.dart';

//Punto de entrada de la aplicación aqui inicia toda la magia
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(
          'Weinflu App 💙',
          style: TextStyle(fontSize: 34, color: Colors.white),
        ),
      ),
      body: const Center(
          child: Text(
        'hola Weincoders 🚀!!!',
        style: TextStyle(fontSize: 34),
      )),
    ),
  ));
}
