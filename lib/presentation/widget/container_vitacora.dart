import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitacora_calorias/presentation/widget/alert_dialog.dart';
import 'package:vitacora_calorias/provider/consumo_diario.dart';

class ContainerVitacora extends StatefulWidget {
  final VoidCallback? onPressedAlimentos;
  final VoidCallback? onPressedCDiario;
  const ContainerVitacora({
    super.key,
    this.onPressedAlimentos,
    this.onPressedCDiario,
  });

  @override
  State<ContainerVitacora> createState() => _ContainerVitacoraState();
}

class _ContainerVitacoraState extends State<ContainerVitacora> {
  @override
  void initState() {
    super.initState();

    context.read<ConsumoDiario>().cargarVariables();
    _checkFirstTime();
  }

  _checkFirstTime() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {});
    bool alert = prefs.getBool('alertDialog') ?? false;

    if (!alert) {
      // ignore: use_build_context_synchronously
      showDialog(
          context: context, builder: (context) => const AlertDialogCustom());
      await Future.delayed(const Duration(milliseconds: 100));

      prefs.setBool('alertDialog', true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final consumoDiario = context.watch<ConsumoDiario>();
    final reset = context.watch<ConsumoDiario>();
    final int proteina = consumoDiario.proteina;
    final int calorias = consumoDiario.calorias;
    final int proteinaAlcanzar = consumoDiario.proteinaAlcanzar;
    final int caloriasAlcanzar = consumoDiario.caloriasAlcanzar;

    final sizeWidth = MediaQuery.of(context).size.width;
    final textfootter = Theme.of(context).textTheme.titleMedium;
    final textTitle = Theme.of(context).textTheme.titleLarge;
    return Container(
      width: sizeWidth,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
        gradient: LinearGradient(
          colors: [
            Colors.blue.shade100,
            Colors.white,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 310,
            ),
            child: IconButton(
              onPressed: () {
                setState(() {});
                reset.proteina = 0;
                reset.calorias = 0;
                reset.indicadorcalorias = 0.0;
                reset.indicadorproteina = 0.0;
                consumoDiario.guardarVariables();
              },
              icon: const Icon(
                Icons.refresh,
                size: 27,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircularPercentIndicator(
                lineWidth: 7,
                animateFromLastPercent: true,
                animation: true,
                curve: Curves.decelerate,
                percent: consumoDiario.indicadorproteina,
                radius: 67,
                footer: Text(
                  '$proteinaAlcanzar gr meta',
                  style: textfootter, // Ajusta según tus necesidades
                ),
                center: Text(
                  '$proteina gr',
                  style: textTitle, // Ajusta según tus necesidades
                ),
                progressColor: Colors.blue, // Ajusta según tus necesidades
              ),
              CircularPercentIndicator(
                percent: consumoDiario.indicadorcalorias,
                lineWidth: 7,
                radius: 75,
                footer: Text(
                  '$caloriasAlcanzar kilocaloría',
                  style: textfootter, // Ajusta según tus necesidades
                ),
                center: Text(
                  '$calorias kcal',
                  style: textTitle, // Ajusta según tus necesidades
                ),
                animateFromLastPercent: true,
                animation: true,
                curve: Curves.decelerate, // Ajusta según tus necesidades
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: widget.onPressedCDiario,
                icon: const Icon(Icons.add_circle_outline_rounded),
                label: const Text('Consumo\nDiario'),
              ),
              ElevatedButton.icon(
                onPressed: widget.onPressedAlimentos,
                icon: const Icon(Icons.add_circle_outline_rounded),
                label: const Text('Alimentos'),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
