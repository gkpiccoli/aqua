import 'package:flutter/material.dart';
import 'ui/home_page.dart';
import 'ui/input_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/inputPage': (context) => InputPage(),
      },
    );
  }
}
