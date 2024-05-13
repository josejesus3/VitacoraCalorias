// ignore_for_file: prefer_is_empty

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitacora_calorias/presentation/screen/page_view_requisitos.dart';
import 'package:vitacora_calorias/presentation/widget/alert_dialog.dart';
import 'package:vitacora_calorias/presentation/widget/aliment_list.dart';
import 'package:vitacora_calorias/provider/consumo_diario.dart';
import 'package:vitacora_calorias/provider/lista_alimentos.dart';
import 'package:vitacora_calorias/presentation/widget/container_vitacora.dart';
import 'package:vitacora_calorias/presentation/widget/formulario.dart';

class VitacoraCalorias extends StatefulWidget {
  static String name='vitacoraCalorias';
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
    final reset = context.watch<ConsumoDiario>();
    final consumoDiario = context.watch<ConsumoDiario>();

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
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
          IconButton(onPressed: (){
Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PageViewRequisitos(),));
          }, icon: const Icon(Icons.settings))
        ],
      ),

      floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(vertical: 35,horizontal: 20),
          child: ElevatedButton.icon(
              onPressed: () => showDialog(
                  context: context,
                  builder: (context) => const PageViewRequisitos()),
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
