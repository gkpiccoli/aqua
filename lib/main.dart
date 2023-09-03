import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'blocs/water_calculator_bloc.dart';
import 'providers/water_calculator_provider.dart';
import 'ui/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<WaterCalculatorBloc>(
          create: (context) => WaterCalculatorBloc(),
          dispose: (context, bloc) => bloc.dispose(),
        ),
      ],
      child: MaterialApp(
        title: 'Calculadora de Água',
        home: HomePage(),
      ),
    );
  }
}
