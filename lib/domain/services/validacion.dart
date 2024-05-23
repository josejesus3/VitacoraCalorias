import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitacora_calorias/presentation/widget/shared/list_title_content.dart';
import 'package:vitacora_calorias/provider/provider.dart';

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

    double valorGET = 0.0;
    double valorMB = 0.0;
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

      return;
    }

    if (peso <= 0) {
      FocusScope.of(context).requestFocus(focusPeso);

      return;
    }

    if (edad < 3 || edad > 80) {
      FocusScope.of(context).requestFocus(focusEdad);

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
          valorGET = 1.2;
          break;
        case 1:
          valorGET = 1.375;
          break;
        case 2:
          valorGET = 1.55;
          break;
        case 3:
          valorGET = 1.725;
          break;
        case 4:
          valorGET = 1.9;
          break;
        // Agrega más casos según necesites
        default:
          break;
      }
    }

    ///MB MASCULINO
    if (colorMasculino == true && edad >= 18 && edad <= 30) {
      valorMB = 88.362;
    } else if (colorMasculino == true && edad >= 31 && edad <= 50) {
      valorMB = 879;
    } else if (colorMasculino == true && edad >= 51 && edad <= 80) {
      valorMB = 487.6;
    }

    ///MB FEMENINO
    if (colorFemenino == true && edad >= 18 && edad <= 30) {
      valorMB = 447.593;
    } else if (colorFemenino == true && edad >= 31 && edad <= 50) {
      valorMB = 795;
    } else if (colorFemenino == true && edad >= 51 && edad <= 80) {
      valorMB = 593;
    }
    if (colorMasculino == true) {
      controller.nextPage(
          duration: const Duration(milliseconds: 420),
          //curve: Curves.easeInCirc
          curve: Curves.decelerate);
      calculo.calcularHombre(
        nuevaAltura: altura,
        nuevoPeso: peso,
        nuevaEdad: edad,
        nuevaGET: valorGET,
        nuevaMB: valorMB,
      );
      calculo.calculoBajarPeso();
      calculo.calculoSubirPeso();
      calculo.calculoMantener(peso);
      calculo.calculoSubirProteina(peso);
    } else {
      controller.nextPage(
          duration: const Duration(milliseconds: 420),
          curve: Curves.decelerate);
      calculo.calcularMujer(
        nuevaAltura: altura,
        nuevoPeso: peso,
        nuevaEdad: edad,
        nuevaGET: valorGET,
        nuevaMB: valorMB,
      );
      calculo.calculoBajarPeso();
      calculo.calculoSubirPeso();
      calculo.calculoMantener(peso);
      calculo.calculoSubirProteina(peso);
    }

    // Resto de la lógica de validación...
  }
}
