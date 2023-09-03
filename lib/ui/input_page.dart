import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../blocs/water_calculator_bloc.dart';

class InputPage extends StatelessWidget {
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  final ageController = TextEditingController();

  InputPage({super.key});
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<WaterCalculatorBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de Água'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          TextField(
            controller: weightController,
            decoration: const InputDecoration(labelText: 'Peso (kg)'),
            keyboardType: TextInputType.number,
            // Aqui você pode pegar o valor e usar no seu BLoC
          ),
          TextField(
            controller: heightController,
            decoration: const InputDecoration(labelText: 'Altura (cm)'),
            keyboardType: TextInputType.number,
            // Aqui você pode pegar o valor e usar no seu BLoC
          ),
          TextField(
            controller: ageController,
            decoration: const InputDecoration(labelText: 'Idade'),
            keyboardType: TextInputType.number,
            // Aqui você pode pegar o valor e usar no seu BLoC
          ),
          ElevatedButton(
            onPressed: () {
              double weight = double.tryParse(weightController.text) ?? 0.0;
              double height = double.tryParse(heightController.text) ?? 0.0;
              int age = int.tryParse(ageController.text) ?? 0;
              bloc.calculateWaterAmount(weight, height, age);
              // Aqui você pode chamar o método do seu BLoC para calcular a quantidade de água
            },
            child: const Text('Calcular'),
          ),
          StreamBuilder<double>(
            stream: bloc.waterAmount,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const Text(
                  'Você deve beber \${snapshot.data} ml de água por dia!',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                );
              } else {
                return const Text(
                    'Insira seus dados para calcular a quantidade de água!');
              }
            },
          ),
        ]),
      ),
    );
  }
}
