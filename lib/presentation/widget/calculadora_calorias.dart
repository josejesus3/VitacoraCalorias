import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculadorCalorias extends StatelessWidget {
  const CalculadorCalorias({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController altura = TextEditingController();

    final sized = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: Row(
        children: [
          const Spacer(),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.backspace_outlined),
            label: const Text('Cancelar'),
          ),
          const SizedBox(
            width: 20,
          ),
          ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.check_circle_outlined),
              label: const Text('Aceptar')),
          const Spacer(),
        ],
      ),
      appBar: AppBar(
        title: const Center(
          child: Text('Requisitos'),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Spacer(),
              GestureDetector(
                onTap: () {
                  print('Presionado');
                },
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(148, 56, 142, 60),
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(50)),
                  child: const Icon(Icons.person_2_outlined),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(50)),
                  child: const Icon(Icons.person_3_outlined),
                ),
              ),
              const Spacer(),
            ],
          ),
          _FormularioRegistro(
            nombreCampo: 'Altura/Cm',
            textContrller: altura,
            icon: Icons.height_outlined,
          ),
          _FormularioRegistro(
            nombreCampo: 'Peso/Kg',
            textContrller: altura,
            icon: Icons.monitor_weight_outlined,
          ),
          _FormularioRegistro(
            nombreCampo: 'Edad',
            textContrller: altura,
            icon: Icons.person_2_outlined,
          ),
          const SizedBox(
            height: 20,
          ),
          const _CheckBoxGet(
            title: 'Sedentario (poco o ningun ejercicio)',
            value: false,
          ),
          const _CheckBoxGet(
            title: 'Ligero (Deportes 1-3 dias a la semana)',
            value: false,
          ),
          const _CheckBoxGet(
            title: 'Moderado (Deportes 3-5 dias a la semana)',
            value: false,
          ),
          const _CheckBoxGet(
            title: 'Activo (Deportes 6-7 dias a la semana)',
            value: false,
          ),
          const _CheckBoxGet(
            title:
                'Muy activo (Ejercicio muy fuerte y trabajo fisico diario o entrenamiento dos veces al dia)',
            value: false,
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class _CheckBoxGet extends StatelessWidget {
  final bool value;
  final String title;
  const _CheckBoxGet({
    super.key,
    required this.value,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
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
  final TextEditingController textContrller;
  final IconData icon;
  final String nombreCampo;
  const _FormularioRegistro({
    required this.textContrller,
    required this.nombreCampo,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder inputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.black));
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        width: 200,
        child: TextField(
          controller: textContrller,
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
