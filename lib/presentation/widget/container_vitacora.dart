import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
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

    //_checkFirstTime();
  }

  @override
  Widget build(BuildContext context) {
    final consumoDiario = context.watch<ConsumoDiario>();
    final int proteina = consumoDiario.proteina;
    final int calorias = consumoDiario.calorias;
    final int proteinaAlcanzar = consumoDiario.proteinaAlcanzar;
    final int caloriasAlcanzar = consumoDiario.caloriasAlcanzar;
    final sizeWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: sizeWidth,
      height: 280,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _LinearProgress(
            sizeWidth: sizeWidth,
            consumoDiario: consumoDiario.indicadorcalorias,
            porcentaje: calorias,
            metaAlcanzar: caloriasAlcanzar,
            subTitle: ' kcal',
            title: 'Calorias',
          ),
          _LinearProgress(
            sizeWidth: sizeWidth,
            consumoDiario: consumoDiario.indicadorproteina,
            porcentaje: proteina,
            metaAlcanzar: proteinaAlcanzar,
            subTitle: ' P',
            title: 'Proteinas',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _BotonesConfirmacion(
                  onPressed: widget.onPressedCDiario!,
                  title: 'Consumo Diario',
                  icon: Icons.add_circle_outline_rounded),
              _BotonesConfirmacion(
                  onPressed: widget.onPressedAlimentos!,
                  title: 'Alimentos',
                  icon: Icons.add_circle_outline_rounded)
            ],
          ),
          const SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}

class _LinearProgress extends StatelessWidget {
  final int porcentaje;
  final int metaAlcanzar;
  final double sizeWidth;
  final String subTitle;
  final String title;
  final double consumoDiario;
  const _LinearProgress({
    required this.sizeWidth,
    required this.consumoDiario,
    required this.porcentaje,
    required this.metaAlcanzar,
    required this.subTitle,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final textTitle = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 6),
            child: Text(
              title,
              style: textTitle.titleMedium,
            )),
        LinearPercentIndicator(
          width: sizeWidth * 1,
          lineHeight: 10.0,
          percent: consumoDiario,
          backgroundColor: Colors.grey,
          progressColor: const Color.fromARGB(122, 56, 142, 60),
          barRadius: const Radius.circular(3),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            " $porcentaje/$metaAlcanzar$subTitle",
            style: textTitle.bodyMedium,
          ),
        ),
      ],
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
      style: ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll(
          Color(0xFF39E079),
        ),
        minimumSize: MaterialStateProperty.all(const Size(50, 50)),
      ),
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(title),
    );
  }
}
