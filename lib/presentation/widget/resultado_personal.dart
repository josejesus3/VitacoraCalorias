import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitacora_calorias/presentation/widget/shared/boton_confirmacion.dart';
import 'package:vitacora_calorias/provider/provider.dart';

class ResultadoPersonal extends StatelessWidget {
  final PageController controller;
  const ResultadoPersonal({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final alert = context.watch<ConsumoDiario>();
    final consumoDiario = context.watch<ConsumoDiario>();
    final calculo = context.watch<FormulaProvider>();

    return Column(
      children: [
        FadeInLeft(
          child: _Respuestas(
            title: 'Perder Peso',
            imagenLocal: 'assets/bajarPeso.png',
            textMax: '''Este consumo diario de calorías te
          permitirá perder 0,5-1 kg por semana 
          de una forma sana y sostenible.''',
            resultado: calculo.consumoBajarPeso.toString().length > 7
                ? calculo.consumoBajarPeso.toString().substring(0, 7)
                : calculo.consumoBajarPeso.toString(),
            onTap: () {
              if (!consumoDiario.checkFirstTime) {
                alert.metaAlcanzar(calculo.proteinaMantener.toInt(),
                    calculo.consumoBajarPeso, true);
                consumoDiario.primerCalculo(true);
              } else {
                alert.metaAlcanzar(calculo.proteinaMantener.toInt(),
                    calculo.consumoBajarPeso, true);
                Navigator.of(context).pop();
              }
            },
          ),
        ),
        FadeInRight(
          child: _Respuestas(
            title: 'Mantener Peso',
            imagenLocal: 'assets/balanza.png',
            textMax: '''Este consumo diario de calorías te 
          permitirá mantener tu peso actual.''',
            resultado: calculo.resultado.toString().length > 7
                ? calculo.resultado.toString().substring(0, 7)
                : calculo.resultado.toString(),
            onTap: () {
              if (!consumoDiario.checkFirstTime) {
                alert.metaAlcanzar(
                    calculo.proteinaMantener.toInt(), calculo.resultado, true);
                consumoDiario.primerCalculo(true);
              } else {
                alert.metaAlcanzar(
                    calculo.proteinaMantener.toInt(), calculo.resultado, true);
                Navigator.of(context).pop();
              }
            },
          ),
        ),
        FadeInLeft(
          child: _Respuestas(
            title: 'Ganar Masa Muscular',
            imagenLocal: 'assets/masaMuscular.png',
            textMax: '''Este consumo diario de calorías te 
          permitirá ganar 0,5-1 kg por semana 
          de una forma sana y sostenible.''',
            resultado: calculo.consumoSubirPeso.toString().length > 7
                ? calculo.consumoSubirPeso.toString().substring(0, 7)
                : calculo.consumoSubirPeso.toString(),
            onTap: () {
              if (!consumoDiario.checkFirstTime) {
                alert.metaAlcanzar(calculo.proteinaSubirPeso.toInt(),
                    calculo.consumoSubirPeso, true);
                consumoDiario.primerCalculo(true);
              } else {
                alert.metaAlcanzar(calculo.proteinaSubirPeso.toInt(),
                    calculo.consumoSubirPeso, true);
                Navigator.of(context).pop();
              }
            },
          ),
        ),
        FadeInUp(
          child: BotonesConfirmacion(
            onPressed: () {
              controller.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.decelerate);
            },
            title: 'Atras',
            icon: Icons.backspace_outlined,
          ),
        ),
      ],
    );
  }
}

class _Respuestas extends StatelessWidget {
  final String imagenLocal;
  final String textMax;
  final String title;
  final String resultado;
  final GestureTapCallback onTap;
  const _Respuestas({
    required this.imagenLocal,
    required this.textMax,
    required this.title,
    required this.resultado,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleLarge;
    return InkWell(
      splashColor: Colors.lime.shade200,
      radius: 50,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Container(
          width: 350,
          decoration: BoxDecoration(
              border: Border.all(), borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Text(
                title,
                style: textStyle,
              ),
              SizedBox(
                width: 100,
                child: Image.asset(
                  imagenLocal,
                  fit: BoxFit.cover,
                ),
              ),
              Text(resultado, style: textStyle),
              Text(textMax)
            ],
          ),
        ),
      ),
    );
  }
}
