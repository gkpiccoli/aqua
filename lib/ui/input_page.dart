import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../blocs/water_calculator_bloc.dart';

class InputPage extends StatelessWidget {
  const InputPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<WaterCalculatorBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de Água'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(labelText: 'Peso (kg)'),
              keyboardType: TextInputType.number,
              // Aqui você pode pegar o valor e usar no seu BLoC
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Altura (cm)'),
              keyboardType: TextInputType.number,
              // Aqui você pode pegar o valor e usar no seu BLoC
            ),
            ElevatedButton(
              onPressed: () {
                // Aqui você pode chamar o método do seu BLoC para calcular a quantidade de água
              },
              child: const Text('Calcular'),
            ),
          ],
        ),
      ),
    );
  }
}
