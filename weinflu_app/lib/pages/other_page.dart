import 'package:flutter/material.dart';

import '../models/user.dart';


class OtherPage extends StatelessWidget {
  final User userData;
  const OtherPage({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Other Page'),
      ),
      body: Center(
          child: TextButton(
        child:  Text('hola ${userData.name} ustedes en promedio tienen ${userData.age} '),
        onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }
}
