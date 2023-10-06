import 'package:aqua/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../blocs/water_calculator_bloc.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  InputPageState createState() => InputPageState();
}

class InputPageState extends State<InputPage> {
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  final ageController = TextEditingController();
  String dropdownValue = 'Sedentário';

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<WaterCalculatorAmount>(context);

    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[400],
        title: const Text(
          'Calculadora de Água',
          style: TextStyle(fontFamily: 'Raleway', letterSpacing: 2),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          TextFormField(
            controller: weightController,
            decoration: const InputDecoration(labelText: 'Peso (kg)'),
            keyboardType: TextInputType.number,
            validator: Validators.numberValidator,
          ),
          TextFormField(
            controller: heightController,
            decoration: const InputDecoration(labelText: 'Altura (cm)'),
            keyboardType: TextInputType.number,
            validator: Validators.numberValidator,
          ),
          TextFormField(
            controller: ageController,
            decoration: const InputDecoration(labelText: 'Idade'),
            keyboardType: TextInputType.number,
            validator: Validators.numberValidator,
          ),
          DropdownButton<String>(
            value: dropdownValue,
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
            items: <String>[
              'Sedentário',
              'Atividade moderada',
              'Alta atividade'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          ElevatedButton(
            onPressed: () {
              double weight = double.tryParse(weightController.text) ?? 0.0;
              double height = double.tryParse(heightController.text) ?? 0.0;
              int activityLevel = mapActivityLevel(dropdownValue);
              bloc.calculateWaterAmount(
                  weight, height, activityLevel); // Novo parâmetro
            },
            child: const Text('Calcular'),
          ),
          StreamBuilder<double>(
            stream: bloc.waterAmount,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                double liters = snapshot.data! / 1000;
                return Text(
                  'Você deve beber ${liters.toStringAsFixed(2)} litros de água por dia!',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
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

  int mapActivityLevel(String level) {
    if (level == 'Sedentário') return 1;
    if (level == 'Atividade moderada') return 2;
    if (level == 'Altleta profissonal') return 3;
    return 1;
  }
}
