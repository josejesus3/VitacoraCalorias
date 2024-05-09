import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CalculadorCalorias extends StatelessWidget {
  final PageController controller;
  const CalculadorCalorias({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    TextEditingController alturaController = TextEditingController();
    TextEditingController pesoController = TextEditingController();
    TextEditingController edadController = TextEditingController();

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
                      icon: Icons.person_2_outlined,
                      onTap: () {
                        print('Presionado');
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _IconoCirculo(
                      icon: Icons.person_3_outlined,
                      onTap: () {},
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
          const _CheckBoxGet(
            title: 'Sedentario (poco o ningun ejercicio)',
          ),
          const _CheckBoxGet(
            title: 'Ligero (Deportes 1-3 dias a la semana)',
          ),
          const _CheckBoxGet(
            title: 'Moderado (Deportes 3-5 dias a la semana)',
          ),
          const _CheckBoxGet(
            title: 'Activo (Deportes 6-7 dias a la semana)',
          ),
          const _CheckBoxGet(
            title:
                'Muy activo (Ejercicio muy fuerte y trabajo fisico diario o entrenamiento dos veces al dia)',
          ),
          const SizedBox(
            height: 30,
          ),
         
          const SizedBox(
            width: 20,
          ),
          _BotonesConfirmacion(
            onPressed: () {
              controller.nextPage(
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
  const _CheckBoxGet({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final sized = MediaQuery.of(context).size;
    return SizedBox(
      width: sized.width * 0.9,
      child: CheckboxListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        value: false,
        onChanged: (value) {},
        title: Text(title),
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
  final IconData icon;
  final VoidCallback onTap;
  const _IconoCirculo({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
            color: const Color.fromARGB(122, 56, 142, 60),
            border: Border.all(),
            borderRadius: BorderRadius.circular(50)),
        child: Icon(icon),
      ),
    );
  }
}
