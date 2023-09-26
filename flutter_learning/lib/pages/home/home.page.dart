import 'package:flutter/material.dart';
import 'package:flutter_learning/pages/home/home.dart';
import 'package:flutter_learning/pages/home/details.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Remind',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: Details(),
    );
  }
}
