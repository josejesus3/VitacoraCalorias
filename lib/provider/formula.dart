import 'package:flutter/material.dart';

class FormulaProvider extends ChangeNotifier {
  double resultado = 0;
  double consumoBajarPeso = 0;
  double consumoSubirPeso = 0;

  void calcularHombre({
    required int nuevaAltura,
    required double nuevoPeso,
    required int nuevaEdad,
    required double nuevaGET,
    required double nuevaMB,
  }) {
    double alturaEnMetros = nuevaAltura / 100.0;
    String alturaFormateada = alturaEnMetros.toStringAsFixed(2);

    if (nuevaEdad >= 3 && nuevaEdad <= 10) {
      resultado =
          (22.7 * nuevoPeso) + (495 * double.parse(alturaFormateada)) - 454;
    } else if (nuevaEdad >= 11 && nuevaEdad <= 17) {
      resultado =
          (17.5 * nuevoPeso) + (651 * double.parse(alturaFormateada)) - 231;
    } else if (nuevaEdad >= 18 && nuevaEdad <= 30) {
      double calculo = nuevaMB +
          (13.397 * nuevoPeso) +
          (4.799 * nuevaAltura) -
          (5.677 * nuevaEdad);
      resultado = calculo * nuevaGET;
    } else if (nuevaEdad >= 31 && nuevaEdad <= 50) {
      double calculo = nuevaMB +
          (13.397 * nuevoPeso) +
          (6.25 * nuevaAltura) -
          (5 * nuevaEdad);
      resultado = calculo * nuevaGET;
    } else if (nuevaEdad >= 51 && nuevaEdad <= 80) {
      double calculo = nuevaMB +
          (9.247 * nuevoPeso) +
          (3.098 * nuevaAltura) -
          (4.330 * nuevaEdad);
      resultado = calculo * nuevaGET;
    }

    notifyListeners();
  }

  void calcularMujer({
    required int nuevaAltura,
    required double nuevoPeso,
    required int nuevaEdad,
    required double nuevaGET,
    required double nuevaMB,
  }) {
    double alturaEnMetros = nuevaAltura / 100.0;
    String alturaFormateada = alturaEnMetros.toStringAsFixed(2);

    if (nuevaEdad >= 3 && nuevaEdad <= 10) {
      resultado =
          (22.5 * nuevoPeso) + (499 * double.parse(alturaFormateada)) - 450;
    } else if (nuevaEdad >= 11 && nuevaEdad <= 17) {
      resultado =
          (12.2 * nuevoPeso) + (746 * double.parse(alturaFormateada)) - 304;
    } else if (nuevaEdad >= 18 && nuevaEdad <= 30) {
      double calculo = nuevaMB +
          (9.247 * nuevoPeso) +
          (3.098 * nuevaAltura) -
          (4.330 * nuevaEdad);
      resultado = calculo * nuevaGET;
    } else if (nuevaEdad >= 31 && nuevaEdad <= 50) {
      double calculo = nuevaMB +
          (7.18 * nuevoPeso) +
          (3.1 * nuevaAltura) -
          (4.3 * nuevaEdad);
      resultado = calculo * nuevaGET;
    } else if (nuevaEdad >= 51 && nuevaEdad <= 80) {
      double calculo = nuevaMB +
          (10.7 * nuevoPeso) +
          (5.1 * nuevaAltura) -
          (6.8 * nuevaEdad);
      resultado = calculo * nuevaGET;
    }

    notifyListeners();
  }

  void calculoBajarPeso() {
    consumoBajarPeso = resultado - 500;
    notifyListeners();
  }

  void calculoSubirPeso() {
    consumoSubirPeso = resultado + 500;
    notifyListeners();
  }
}
