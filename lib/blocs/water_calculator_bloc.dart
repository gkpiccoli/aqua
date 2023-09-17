import 'dart:async';
import 'package:flutter/material.dart';

class WaterCalculatorAmount {
  // StreamController para gerenciar o estado da quantidade de água
  final _waterAmountController = StreamController<double>.broadcast();

  // Stream e Sink
  Stream<double> get waterAmount => _waterAmountController.stream;
  Sink<double> get _setWaterAmount => _waterAmountController.sink;

  // Função para calcular a quantidade de água
  void calculateWaterAmount(double weight, double height, int activityLevel) {
    // Lógica para calcular a quantidade de água
    double amount = (weight * 30) + (height * 0.1) + (activityLevel * 200);
    debugPrint('Quantidade de agua calculada: $amount ml');
    
    // Atualizar o estado
    _setWaterAmount.add(amount);
  }

  // Função para descartar o StreamController
  void dispose() {
    _waterAmountController.close();
  }
}
