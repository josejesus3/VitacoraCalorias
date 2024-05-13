import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:vitacora_calorias/domain/services/validacion.dart';

import 'package:vitacora_calorias/provider/provider_globales.dart';

class CalculadorCalorias extends StatefulWidget {
  final PageController controller;
  const CalculadorCalorias({super.key, required this.controller});

  @override
  State<CalculadorCalorias> createState() => _CalculadorCaloriasState();
}

@override
final FocusNode focusAltura = FocusNode();
final FocusNode focusPeso = FocusNode();
final FocusNode focusEdad = FocusNode();
TextEditingController alturaController = TextEditingController();
TextEditingController pesoController = TextEditingController();
TextEditingController edadController = TextEditingController();
bool showError = false;

class _CalculadorCaloriasState extends State<CalculadorCalorias> {
  @override
  Widget build(BuildContext context) {
    final providerGlobal = context.read<ProviderGlobales>();

    final checkValidacion = context.read<ProviderGlobales>().checkValidacion;
    final colorActiveMasculino =
        context.watch<ProviderGlobales>().colorMasculino;
    final colorActiveFemenino = context.watch<ProviderGlobales>().colorFemenino;

    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _IconoCirculo(
                imagenLocal: 'assets/iconHombre.png',
                title: 'Masculino',
                onTap: () {
                  setState(() {});
                  providerGlobal.cambiarColorMasculino();
                },
                providerGlobal: colorActiveMasculino,
              ),
              const SizedBox(
                width: 20,
              ),
              _IconoCirculo(
                imagenLocal: 'assets/iconMujer.png',
                title: 'Femenino',
                onTap: () {
                  setState(() {});
                  providerGlobal.cambiarColorFemenino();
                },
                providerGlobal: colorActiveFemenino,
              ),
            ],
          ),
          _FormularioRegistro(
            nombreCampo: 'Altura/Cm',
            textController: alturaController,
            icon: Icons.height_outlined,
            focus: focusAltura,
            errorText: 'Ingresar Altura',
            maxLength: 3,
          ),
          _FormularioRegistro(
            nombreCampo: 'Peso/Kg',
            textController: pesoController,
            icon: Icons.monitor_weight_outlined,
            focus: focusPeso,
            errorText: 'Ingresar Peso',
            maxLength: 4,
          ),
          _FormularioRegistro(
            nombreCampo: 'Edad',
            textController: edadController,
            icon: Icons.person_2_outlined,
            focus: focusEdad,
            errorText: 'Ingresar edad mayor a 3 años y menor a 80',
            maxLength: 3,
          ),
          _CheckBoxGet(
            title: 'Sedentario',
            message: 'poco o ningun ejercicio',
            valueX: providerGlobal.checkList[0],
            onChanged: (value) {
              providerGlobal.updateCheckbox(0, value);
            },
          ),
          _CheckBoxGet(
            title: 'Ligero',
            message: 'Deportes 1-3 dias a la semana',
            valueX: providerGlobal.checkList[1],
            onChanged: (value) {
              providerGlobal.updateCheckbox(1, value);
            },
          ),
          _CheckBoxGet(
            title: 'Moderado ',
            message: 'Deportes 3-5 dias a la semana',
            valueX: providerGlobal.checkList[2],
            onChanged: (value) {
              providerGlobal.updateCheckbox(2, value);
            },
          ),
          _CheckBoxGet(
            title: 'Activo',
            message: 'Deportes 6-7 dias a la semana',
            valueX: providerGlobal.checkList[3],
            onChanged: (value) {
              providerGlobal.updateCheckbox(3, value);
            },
          ),
          _CheckBoxGet(
            title: 'Muy activo ',
            message:
                'Ejercicio muy fuerte y trabajo fisico diario o entrenamiento dos veces al dia',
            valueX: providerGlobal.checkList[4],
            onChanged: (value) {
              providerGlobal.updateCheckbox(4, value);
            },
          ),
          const SizedBox(
            height: 40,
          ),
          _BotonesConfirmacion(
            onPressed: () {
              ValidacionesUtil.validar(
                altura: int.tryParse(alturaController.text) ?? 0,
                peso: double.tryParse(pesoController.text) ?? 0,
                edad: int.tryParse(edadController.text) ?? 0,
                checkBox: checkValidacion,
                colorFemenino: colorActiveFemenino,
                colorMasculino: colorActiveMasculino,
                context: context,
                controller: widget.controller,
                focusAltura: focusAltura,
                focusPeso: focusPeso,
                focusEdad: focusEdad,
              );
              showError = true;
            },
            title: 'Aceptar',
            icon: Icons.check_circle_outlined,
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
      style: ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll(
          Color(0xFF39E079),
        ),
        minimumSize: MaterialStateProperty.all(const Size(350, 50)),
      ),
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(title),
    );
  }
}

class _CheckBoxGet extends StatelessWidget {
  final String title;
  final String message;
  final bool valueX;
  final ValueChanged onChanged;

  const _CheckBoxGet({
    required this.title,
    required this.message,
    required this.valueX,
    required this.onChanged,
  });

  @override
  @override
  Widget build(BuildContext context) {
    final sized = MediaQuery.of(context).size;
    return SizedBox(
      width: sized.width * 0.5,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          CheckboxListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            controlAffinity: ListTileControlAffinity.leading,
            value: valueX,
            onChanged: onChanged,
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
  final FocusNode focus;
  final String errorText;
  final int maxLength;
  const _FormularioRegistro({
    required this.textController,
    required this.nombreCampo,
    required this.icon,
    required this.focus,
    required this.errorText,
    required this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder inputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(color: Colors.black));
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: SizedBox(
        width: 350,
        child: TextField(
          controller: textController,
          focusNode: focus,
          maxLength: maxLength,
          decoration: InputDecoration(
            labelText: nombreCampo,
            errorText:
                showError && (focus.hasFocus && textController.text.isEmpty)
                    ? errorText
                    : null,
            enabledBorder: inputBorder,
            focusedBorder: inputBorder,
            suffixIcon: Icon(icon),
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9-.]'))
          ],
        ),
      ),
    );
  }
}

class _IconoCirculo extends StatelessWidget {
  final String imagenLocal;
  final String title;
  final VoidCallback onTap;
  final bool providerGlobal;
  const _IconoCirculo({
    required this.imagenLocal,
    required this.onTap,
    required this.title,
    required this.providerGlobal,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(imagenLocal),
            maxRadius: 30,
            backgroundColor: providerGlobal == true
                ? const Color.fromARGB(122, 56, 142, 60)
                : Colors.transparent,
          ),
          Text(title)
        ],
      ),
    );
  }
}
