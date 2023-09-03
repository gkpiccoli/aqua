import 'dart:async';

import 'package:flutter/material.dart';

class WaterCalculatorBloc {
  // StreamController para gerenciar o estado da quantidade de água
  final _waterAmountController = StreamController<double>.broadcast();

  // Stream e Sink
  Stream<double> get waterAmount => _waterAmountController.stream;
  Sink<double> get _setWaterAmount => _waterAmountController.sink;

  // Função para calcular a quantidade de água
  void calculateWaterAmount(double weight, double height, int age) {
    // Lógica para calcular a quantidade de água
    // Esta é apenas uma fórmula fictícia
    double amount = (weight + height) / age * 10;
    debugPrint('Quantidade de agua calculada: $amount');
    // Atualizar o estado
    _setWaterAmount.add(amount);
  }

  // Função para descartar o StreamController
  void dispose() {
    _waterAmountController.close();
  }
}
