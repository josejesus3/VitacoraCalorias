import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConsumoDiario extends ChangeNotifier {
  int proteina = 0;
  int calorias = 0;
  bool checkFirstTime = false;
  double indicadorproteina = 0;
  double indicadorcalorias = 0;
  int proteinaAlcanzar = 0, caloriasAlcanzar = 0;

  void aumentarValores(BuildContext context, int proteinaA, int caloriasA) {
    int nProteina = proteina + proteinaA;
    int nCalorias = calorias + caloriasA;

    if (proteinaA == proteinaAlcanzar && indicadorproteina == 0.0) {
      proteina += proteinaA;
      indicadorproteina = 1.0;
    } else if (nProteina > proteinaAlcanzar) {
      // Calcular la cantidad faltante para llegar a 130
      int cantidadFaltante = proteinaAlcanzar - proteina;

      // Asignar la cantidad faltante
      proteina += cantidadFaltante;

      // Actualizar el indicador
      indicadorproteina = proteina / proteinaAlcanzar;
    } else if (proteina < proteinaAlcanzar && indicadorproteina < 1.0) {
      proteina += proteinaA;
      indicadorproteina = proteina / proteinaAlcanzar;
    }

    if (caloriasA == caloriasAlcanzar && indicadorcalorias == 0.0) {
      calorias += caloriasA;
      indicadorcalorias = 1.0;
    } else if (nCalorias > caloriasAlcanzar) {
      // Calcular la cantidad faltante para llegar a 130
      int cantidadFaltante = caloriasAlcanzar - calorias;

      // Asignar la cantidad faltante
      calorias += cantidadFaltante;

      // Actualizar el indicador
      indicadorcalorias = calorias / caloriasAlcanzar;
    } else if (caloriasA < caloriasAlcanzar && indicadorcalorias < 1.0) {
      calorias += caloriasA;
      indicadorcalorias = calorias / caloriasAlcanzar;
    }
    if (indicadorcalorias == 1.0 && indicadorproteina == 1.0) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: const Color.fromARGB(228, 160, 213, 238),
            shadowColor: Colors.lightBlueAccent,
            content: const Text(
              '¡Felicidades! Has completado tu consumo diario de proteínas y calorías.',
              style: TextStyle(color: Colors.white, fontSize: 16.0),
              textAlign: TextAlign.left,
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  indicadorcalorias = 0.0;
                  indicadorproteina = 0.0;
                  proteina = 0;
                  calorias = 0;
                  guardarVariables();
                  notifyListeners();
                  Navigator.of(context).pop();
                },
                child: const Text('Salir'),
              ),
            ],
          );
        },
      );
    }
    guardarVariables();

    notifyListeners();
  }

  void primerCalculo(bool echo) async {
    checkFirstTime = echo;
    guardarPageView();
    notifyListeners();
  }

  void cargarPageView() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    checkFirstTime = prefs.getBool('pageView') ?? false;

    notifyListeners();
  }

  void guardarPageView() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('pageView', checkFirstTime);

    notifyListeners();
  }

  void metaAlcanzar(int prt, double kcal, bool alert) {
    if (alert) {
      proteinaAlcanzar = prt;
      caloriasAlcanzar = int.parse(kcal.toString().substring(0, 4));

      guardarVariables();
      notifyListeners();
    }
  }

  void cargarVariables() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    proteina = prefs.getInt('proteina') ?? 0;
    calorias = prefs.getInt('calorias') ?? 0;
    indicadorproteina = prefs.getDouble('indicadorproteina') ?? 0;
    indicadorcalorias = prefs.getDouble('indicadorcalorias') ?? 0;
    proteinaAlcanzar = prefs.getInt('proteinaAlcanzar') ?? 0;
    caloriasAlcanzar = prefs.getInt(' caloriasAlcanzar') ?? 0;

    notifyListeners();
  }

  void guardarVariables() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('proteina', proteina);
    prefs.setInt('calorias', calorias);
    prefs.setInt('proteinaAlcanzar', proteinaAlcanzar);
    prefs.setInt(' caloriasAlcanzar', caloriasAlcanzar);
    prefs.setDouble('indicadorproteina', indicadorproteina);
    prefs.setDouble('indicadorcalorias', indicadorcalorias);
  }
}
