import 'package:flutter/material.dart';
import 'package:weinflu_app/models/user.dart';

class UserProvider extends InheritedWidget {
  //Información que deseamos compartir
  final User userData;
  const UserProvider({super.key, required super.child, required this.userData});

  //Obtener la información solo utilizando el contexto
  static UserProvider of(BuildContext context) {
    return context.findAncestorWidgetOfExactType<UserProvider>()!;
  }

  @override
  bool updateShouldNotify(UserProvider oldWidget) =>
      oldWidget.userData.name != userData.name ? true : false;
}
