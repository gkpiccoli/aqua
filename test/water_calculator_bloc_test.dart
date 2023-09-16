import 'package:aqua/blocs/water_calculator_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late WaterCalculatorAmount
      bloc; // Usando late para sinalizar que será inicializado posteriormente

  setUp(() {
    bloc = WaterCalculatorAmount(); // Inicializando antes dos testes
  });

  test('calculateWaterAmount returns correct value', () {
    double weight = 70.0;
    double height = 175.0;
    int age = 30;

    bloc.calculateWaterAmount(weight, height, age);

    bloc.waterAmount.listen(expectAsync1((amount) {
      expect(
          amount,
          (weight + height) /
              age *
              10); // Substitua esta linha pela sua fórmula real
    }));
  });
}
