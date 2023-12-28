import 'package:flutter/material.dart';
import 'package:moviest_app/screens/home.dart';

void main() {
  runApp(const MyApp());
}

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blue,
    background: const Color(0xFF0A0118),
    brightness: Brightness.light,
    onBackground: Colors.white,
  ),
  cardColor: Colors.grey[200],
  buttonTheme: const ButtonThemeData(buttonColor: Colors.blue),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 12,
      color: Colors.black45,
    ),
  ),
  useMaterial3: true,
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      home: const HomeWidgetScreen(),
    );
  }
}

//media query for next size screen is  530
