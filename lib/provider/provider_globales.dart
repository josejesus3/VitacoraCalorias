import 'package:flutter/material.dart';

class ProviderGlobales extends ChangeNotifier {
  bool colorMasculino = false;
  bool colorFemenino = false;
  List<bool> checkList = [false, false, false, false, false];
  int? checkValidacion;

  void cambiarColorMasculino() {
    if (colorFemenino == true) {
      colorFemenino = false;
    }
    colorMasculino = !colorMasculino;

    notifyListeners();
  }

  void cambiarColorFemenino() {
    if (colorMasculino == true) {
      colorMasculino = false;
    }
    colorFemenino = !colorFemenino;
    notifyListeners();
  }

  void updateCheckbox(int index, bool value) {
    if (value) {
      for (var i = 0; i < checkList.length; i++) {
        if (i != index) {
          checkList[i] = false;
        }
      }
    }
    checkValidacion = index;
    checkList[index] = value;
    notifyListeners();
  }
}
