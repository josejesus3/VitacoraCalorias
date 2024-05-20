import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vitacora_calorias/presentation/screen/view/vitacora_calorias.dart';
import 'package:vitacora_calorias/provider/consumo_diario.dart';
import 'package:vitacora_calorias/provider/formula.dart';

class ResultadoPersonal extends StatelessWidget {
  final PageController controller;
  const ResultadoPersonal({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final alert = context.watch<ConsumoDiario>();
    final calculo = context.watch<FormulaProvider>().resultado;
    final calculoBajarPeso = context.watch<FormulaProvider>().consumoBajarPeso;
    final calculoSubirPeso = context.watch<FormulaProvider>().consumoSubirPeso;
    return Column(
      children: [
        _Respuestas(
          title: 'Perder Peso',
          imagenLocal: 'assets/bajarPeso.png',
          textMax: '''Este consumo diario de calorías te
permitirá perder 0,5-1 kg por semana 
de una forma sana y sostenible.''',
          resultado: calculoBajarPeso.toString().length > 7
              ? calculoBajarPeso.toString().substring(0, 7)
              : calculoBajarPeso.toString(),
          onTap: () {
            alert.metaAlcanzar(140, calculoBajarPeso, true);
            Navigator.of(context).pop();
          },
        ),
        _Respuestas(
          title: 'Mantener Peso',
          imagenLocal: 'assets/balanza.png',
          textMax: '''Este consumo diario de calorías te 
permitirá mantener tu peso actual.''',
          resultado: calculo.toString().length > 7
              ? calculo.toString().substring(0, 7)
              : calculo.toString(),
          onTap: () {
            alert.metaAlcanzar(140, calculo, true);
            Navigator.of(context).pop();
          },
        ),
        _Respuestas(
          title: 'Ganar Masa Muscular',
          imagenLocal: 'assets/masaMuscular.png',
          textMax: '''Este consumo diario de calorías te 
permitirá ganar 0,5-1 kg por semana 
de una forma sana y sostenible.''',
          resultado: calculoSubirPeso.toString().length > 7
              ? calculoSubirPeso.toString().substring(0, 7)
              : calculoSubirPeso.toString(),
          onTap: () {
            alert.metaAlcanzar(140, calculoSubirPeso, true);
            Navigator.of(context).pop();
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 14,
            ),
            _BotonesConfirmacion(
              onPressed: () {
                controller.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInCirc);
              },
              title: 'Atras',
              icon: Icons.backspace_outlined,
            ),
            const SizedBox(
              width: 20,
            ),
            /*_BotonesConfirmacion(
              onPressed: () {
                Navigator.of(context).pop();
              },
              title: 'Aceptar',
              icon: Icons.check_circle_outlined,
            )*/
          ],
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

class _BotonesConfirmacion extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final IconData icon;
  const _BotonesConfirmacion({
    required this.onPressed,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(title),
    );
  }
}
