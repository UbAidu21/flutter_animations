import 'package:flutter/material.dart';
import 'package:flutter_animations/animations/example_06.dart';
// import 'package:flutter_animations/animations/01_example.dart';
// import 'package:flutter_animations/animations/02_example.dart';
// import 'package:flutter_animations/animations/example_03.dart';
// import 'package:flutter_animations/animations/example_04.dart';
import 'package:flutter_animations/animations/example_05.dart';
import 'package:flutter_animations/animations/example_07.dart';
import 'package:flutter_animations/animations/example_08.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Animations',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: const ExampleEight(),
    );
  }
}

