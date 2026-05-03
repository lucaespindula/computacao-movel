import 'package:flutter/material.dart';
import 'package:tbl2/screens/animation_screen.dart';
import 'package:tbl2/screens/opacity_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exercício 1',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const AnimationScreen(), 
    );
  }
}