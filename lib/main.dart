import 'package:aqua/blocs/water_calculator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ui/home_page.dart';
import 'ui/input_page.dart';

void main() {
  runApp(Provider<WaterCalculatorBloc>(
    create: (context) => WaterCalculatorBloc(),
    dispose: (context, bloc) => bloc.dispose(),
    child: const MyApp(),
  ));
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
