import 'package:flutter/material.dart';

class FormulaProvider extends ChangeNotifier {
  double resultado = 0;

  void calcular(
      {required int nuevaAltura,
      required double nuevoPeso,
      required int nuevaEdad,
      required double nuevaGET,
      required double nuevaMB}) {
    resultado = nuevaAltura + nuevaEdad + nuevoPeso + nuevaGET + nuevaMB;
    print(nuevaAltura);
    print(nuevaEdad);
    print(nuevoPeso);
    print(nuevaGET);
    print(nuevaMB);
    notifyListeners();
  }
}
