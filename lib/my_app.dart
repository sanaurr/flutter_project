import 'package:flutter/material.dart';
import 'package:flutter_project/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        colorSchemeSeed: const Color.fromARGB(255, 142, 165, 42),
      ),
      home: 
      const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
