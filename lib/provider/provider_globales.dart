import 'package:flutter/material.dart';

class ProviderGlobales extends ChangeNotifier {
  bool colorMasculino = false;
  bool colorFemenino = false;
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
}
