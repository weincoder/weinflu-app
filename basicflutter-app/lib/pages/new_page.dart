import 'package:flutter/material.dart';
import 'package:weinflu_app/config/app_routes.dart';
import 'package:weinflu_app/models/user.dart';


class NewPage extends StatelessWidget {
  const NewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userData = User(name: 'Weincoders', age: 24);
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Page'),
      ),
      body: Center(
          child: TextButton(
        child: Text('hola todo anda bien'),
        onPressed: () =>
            Navigator.of(context).pushReplacementNamed(AppRoutes.otherPage, arguments: userData),
      )),
    );
  }
}
