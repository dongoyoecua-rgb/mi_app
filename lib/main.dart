import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const Color verdeLima = Color(0xFF8BC34A);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gestor de Bodega',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: verdeLima,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF7F9F4),
        appBarTheme: const AppBarTheme(
          backgroundColor: verdeLima,
          foregroundColor: Colors.black87,
          centerTitle: true,
          elevation: 2,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: verdeLima,
            foregroundColor: Colors.black87,
            padding: const EdgeInsets.symmetric(
              vertical: 14,
              horizontal: 18,
            ),
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: verdeLima,
          foregroundColor: Colors.black87,
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}