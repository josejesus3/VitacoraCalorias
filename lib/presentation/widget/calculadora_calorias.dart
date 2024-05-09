import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:vitacora_calorias/provider/provider_globales.dart';

class CalculadorCalorias extends StatefulWidget {
  final PageController controller;
  const CalculadorCalorias({super.key, required this.controller});

  @override
  State<CalculadorCalorias> createState() => _CalculadorCaloriasState();
}

class _CalculadorCaloriasState extends State<CalculadorCalorias> {
  @override
  Widget build(BuildContext context) {
    TextEditingController alturaController = TextEditingController();
    TextEditingController pesoController = TextEditingController();
    TextEditingController edadController = TextEditingController();
    final colorActive = context.read<ProviderGlobales>();
    final colorActiveMasculino =
        context.watch<ProviderGlobales>().colorMasculino;
    final colorActiveFemenino = context.watch<ProviderGlobales>().colorFemenino;

    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            elevation: 3,
            child: Row(
              children: [
                const Spacer(),
                Column(
                  children: [
                    _IconoCirculo(
                      imagenLocal: 'assets/iconHombre.png',
                      title: 'Masculino',
                      onTap: () {
                        setState(() {});
                        colorActive.cambiarColorMasculino();
                        print('Color Masculino: $colorActiveMasculino');
                      },
                      colorActive: colorActiveMasculino,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _IconoCirculo(
                      imagenLocal: 'assets/iconMujer.png',
                      title: 'Femenino',
                      onTap: () {
                        setState(() {});
                        colorActive.cambiarColorFemenino();
                        print('Color Femenino: $colorActiveFemenino');
                      },
                      colorActive: colorActiveFemenino,
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    _FormularioRegistro(
                      nombreCampo: 'Altura/Cm',
                      textController: alturaController,
                      icon: Icons.height_outlined,
                    ),
                    _FormularioRegistro(
                      nombreCampo: 'Peso/Kg',
                      textController: pesoController,
                      icon: Icons.monitor_weight_outlined,
                    ),
                    _FormularioRegistro(
                      nombreCampo: 'Edad',
                      textController: edadController,
                      icon: Icons.person_2_outlined,
                    ),
                  ],
                ),
                const Spacer()
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Wrap(
            children: [
              _CheckBoxGet(
                title: 'Sedentario',
                message: 'poco o ningun ejercicio',
              ),
              _CheckBoxGet(
                title: 'Ligero',
                message: 'Deportes 1-3 dias a la semana',
              ),
              _CheckBoxGet(
                title: 'Moderado ',
                message: 'Deportes 3-5 dias a la semana',
              ),
              _CheckBoxGet(
                title: 'Activo',
                message: 'Deportes 6-7 dias a la semana',
              ),
              _CheckBoxGet(
                title: 'Muy activo ',
                message:
                    'Ejercicio muy fuerte y trabajo fisico diario o entrenamiento dos veces al dia',
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          _BotonesConfirmacion(
            onPressed: () {
              widget.controller.nextPage(
                  duration: const Duration(milliseconds: 420),
                  curve: Curves.easeInCirc);
            },
            title: 'Aceptar',
            icon: Icons.check_circle_outlined,
          ),
          const SizedBox(
            width: 10,
          ),
        ],
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

class _CheckBoxGet extends StatelessWidget {
  final String title;
  final String message;
  const _CheckBoxGet({
    super.key,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final sized = MediaQuery.of(context).size;
    return SizedBox(
      width: sized.width * 0.5,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          CheckboxListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            controlAffinity: ListTileControlAffinity.leading,
            value: false,
            onChanged: (value) {},
            title: Text(title),
          ),
          Tooltip(
            triggerMode: TooltipTriggerMode.tap,
            showDuration: const Duration(seconds: 1),
            message: message,
            child: const Icon(Icons.help_outline),
          ),
        ],
      ),
    );
  }
}

class _FormularioRegistro extends StatelessWidget {
  final TextEditingController textController;
  final IconData icon;
  final String nombreCampo;
  const _FormularioRegistro({
    required this.textController,
    required this.nombreCampo,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder inputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.black));
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child: SizedBox(
        width: 220,
        child: TextField(
          controller: textController,
          decoration: InputDecoration(
            labelText: nombreCampo,
            enabledBorder: inputBorder,
            focusedBorder: inputBorder,
            suffixIcon: Icon(icon),
          ),
        ),
      ),
    );
  }
}

class _IconoCirculo extends StatelessWidget {
  final String imagenLocal;
  final String title;
  final VoidCallback onTap;
  final bool colorActive;
  const _IconoCirculo({
    required this.imagenLocal,
    required this.onTap,
    required this.title,
    required this.colorActive,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(imagenLocal),
            maxRadius: 45,
            backgroundColor: colorActive == true
                ? const Color.fromARGB(122, 56, 142, 60)
                : Colors.transparent,
          ),
          Text(title)
        ],
      ),
    );
  }
}
