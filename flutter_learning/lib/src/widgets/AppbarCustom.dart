import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('OWNDEX'),
      centerTitle: true,
      backgroundColor: const Color.fromRGBO(1, 93, 105, 0.8),
    );
  }
}
