import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitacora_calorias/presentation/widget/list_title_content.dart';
import 'package:vitacora_calorias/provider/formula.dart';

class ValidacionesUtil {
  static void validar({
    required FocusNode focusAltura,
    required FocusNode focusPeso,
    required FocusNode focusEdad,
    required BuildContext context,
    required PageController controller,
    required int altura,
    required double peso,
    required int edad,
    required int? checkBox,
    required bool colorFemenino,
    required bool colorMasculino,
  }) {
    final calculo = context.read<FormulaProvider>();
    double valor = 0.0;
    double valorGenero = 0.0;
    void showSnackBar(
        BuildContext context, IconData icon, String title, String subtitle) {
      ScaffoldMessenger.of(context).clearSnackBars();
      SnackBar snackBar = SnackBar(
        backgroundColor: const Color.fromARGB(122, 56, 142, 60),
        content: ListTitleContent(icon: icon, title: title, subtitle: subtitle),
        duration: const Duration(seconds: 1),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    if (altura <= 0) {
      FocusScope.of(context).requestFocus(focusAltura);
      showSnackBar(
        context,
        Icons.height_outlined,
        'Altura/Cm',
        'Ingrese una altura válida',
      );
      return;
    }

    if (peso <= 0) {
      FocusScope.of(context).requestFocus(focusPeso);
      showSnackBar(
        context,
        Icons.monitor_weight_outlined,
        'Peso/Kg',
        'Ingrese un peso válido',
      );
      return;
    }

    if (edad < 3 || edad > 80) {
      FocusScope.of(context).requestFocus(focusEdad);
      showSnackBar(
        context,
        Icons.person_2_outlined,
        'Edad',
        'Ingrese una edad válida',
      );
      return;
    }

    if (colorFemenino == false && colorMasculino == false) {
      showSnackBar(
        context,
        Icons.color_lens_outlined,
        'Femenino/Masculino',
        'Elija un género',
      );
      return;
    } else {}
    if (checkBox == null) {
      // Enfoca el campo donde falta checkBox
      showSnackBar(context, Icons.check_box_outlined, 'Marcar Casilla',
          'Debes elegir entre uno de \nlos gastos energeticos');
      return;
    } else {
      switch (checkBox) {
        case 0:
          valor = 1.2;
          break;
        case 1:
          valor = 1.375;
          break;
        case 2:
          valor = 1.55;
          break;
        case 3:
          valor = 1.725;
          break;
        case 4:
          valor = 1.9;
          break;
        // Agrega más casos según necesites
        default:
          break;
      }
    }

    ///MB MASCULINO
    if (colorMasculino == true && edad >= 18 && edad <= 30) {
      valorGenero = 88.362;
    } else if (colorMasculino == true && edad >= 31 && edad <= 50) {
      valorGenero = 879;
    } else if (colorMasculino == true && edad >= 51 && edad <= 80) {
      valorGenero = 487.6;
    }

    ///MB FEMENINO
    if (colorFemenino == true && edad >= 18 && edad <= 30) {
      valorGenero = 447.593;
    } else if (colorFemenino == true && edad >= 31 && edad <= 50) {
      valorGenero = 795;
    } else if (colorFemenino == true && edad >= 51 && edad <= 80) {
      valorGenero = 593;
    }
    controller.nextPage(
        duration: const Duration(milliseconds: 420), curve: Curves.easeInCirc);
    calculo.calcular(
        nuevaAltura: altura,
        nuevoPeso: peso,
        nuevaEdad: edad,
        nuevaGET: valor,
        nuevaMB: valorGenero);

    // Resto de la lógica de validación...
  }
}
