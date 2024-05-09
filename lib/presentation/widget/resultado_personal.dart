import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vitacora_calorias/presentation/screen/vitacora_calorias.dart';

class ResultadoPersonal extends StatelessWidget {
  final PageController controller;
  const ResultadoPersonal({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _Respuestas(
          title: 'Perder Peso',
          imagenLocal: 'assets/bajarPeso.png',
          textMax: '''Este consumo diario de calorías te
permitirá perder 0,5-1 kg por semana 
de una forma sana y sostenible.''',
        ),
        const _Respuestas(
          title: 'Mantener Peso',
          imagenLocal: 'assets/barra.png',
          textMax: '''Este consumo diario de calorías te 
permitirá mantener tu peso actual.''',
        ),
        const _Respuestas(
          title: 'Ganar Peso',
          imagenLocal: 'assets/masaMuscular.png',
          textMax: '''Este consumo diario de calorías te 
permitirá ganar 0,5-1 kg por semana 
de una forma sana y sostenible.''',
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
            _BotonesConfirmacion(
              onPressed: () {
                context.go('/home');
              },
              title: 'Aceptar',
              icon: Icons.check_circle_outlined,
            ),
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
  const _Respuestas({
    required this.imagenLocal,
    required this.textMax,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleLarge;
    return Padding(
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
            Text('2,300', style: textStyle),
            Text(textMax)
          ],
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
