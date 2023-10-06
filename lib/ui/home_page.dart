import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const _backgroundColor = Color.fromARGB(255, 204, 206, 226);

  static const _colors = [
    Color.fromARGB(255, 39, 154, 241),
    Color(0xFF00BBF9),
  ];

  static const _durations = [
    5000,
    4000,
  ];

  static const _heightPercentages = [
    0.50,
    0.66,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bem-vindo ao Calculadora de Água'),
      ),
      body: Stack(
        children: [
          WaveWidget(
            config: CustomConfig(
              colors: _colors,
              durations: _durations,
              heightPercentages: _heightPercentages,
            ),
            backgroundColor: _backgroundColor,
            size: const Size(
              double.infinity,
              double.infinity,
            ),
            waveAmplitude: 0,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Descubra quanto de água você precisa beber todos os dias!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/inputPage');
                  },
                  child: const Text('Começar o teste'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
