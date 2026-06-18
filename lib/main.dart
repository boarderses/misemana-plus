import 'package:flutter/material.dart';
import 'package:misemana_plus/presentation/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MiSemana+',
      home: const SplashScreen(),
    );
  }
}