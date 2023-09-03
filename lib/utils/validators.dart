class Validators {
  static String? numberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira um  valor';
    }
    if (double.tryParse(value) == null) {
      return 'Por favor, insira um número válido';
    }
    return null;
  }
}
