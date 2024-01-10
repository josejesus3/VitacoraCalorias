// ignore_for_file: prefer_is_empty

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitacora_calorias/presentation/widget/alert_dialog.dart';
import 'package:vitacora_calorias/presentation/widget/aliment_list.dart';
import 'package:vitacora_calorias/provider/lista_alimentos.dart';
import 'package:vitacora_calorias/presentation/widget/container_vitacora.dart';
import 'package:vitacora_calorias/presentation/widget/formulario.dart';

class VitacoraCalorias extends StatefulWidget {
  const VitacoraCalorias({super.key});

  @override
  State<VitacoraCalorias> createState() => _VitacoraCaloriasState();
}

class _VitacoraCaloriasState extends State<VitacoraCalorias> {
  @override
  void initState() {
    super.initState();

    // Cargar la lista al iniciar la aplicación
    context.read<ListaAlimentos>().cargarLista();
  }

  @override
  Widget build(BuildContext context) {
    // Llamar a alertDialog solo en el método build

    return Scaffold(

      floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(vertical: 35,horizontal: 20),
          child: ElevatedButton.icon(
              onPressed: () => showDialog(
                  context: context,
                  builder: (context) => const AlertDialogCustom()),
              icon: const Icon(Icons.home_repair_service_outlined),
              label: const Text('Ajustar'))),
      body: SafeArea(
        child: Column(
          children: [
            ContainerVitacora(
              onPressedAlimentos: () {
                setState(() {
                  showDialog(
                    context: context,
                    builder: (context) => const Formulario(),
                  );
                });
              },
              onPressedCDiario: () => setState(() {
                showDialog(
                  context: context,
                  builder: (context) => const FormularioDiario(),
                );
              }),
            ),
            const SizedBox(
              height: 15,
            ),
            const AlimetLista(),
          ],
        ),
      ),
    );
  }
}
