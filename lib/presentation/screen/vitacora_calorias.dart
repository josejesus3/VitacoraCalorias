// ignore_for_file: prefer_is_empty
// Ignora las advertencias relacionadas con el uso de isEmpty en este archivo

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitacora_calorias/presentation/screen/page_view_requisitos.dart';
import 'package:vitacora_calorias/presentation/widget/aliment_list.dart';
import 'package:vitacora_calorias/provider/consumo_diario.dart';
import 'package:vitacora_calorias/provider/lista_alimentos.dart';
import 'package:vitacora_calorias/presentation/widget/container_vitacora.dart';
import 'package:vitacora_calorias/presentation/widget/shared/formulario.dart';

class VitacoraCalorias extends StatefulWidget {
  const VitacoraCalorias({super.key});

  @override
  State<VitacoraCalorias> createState() => _VitacoraCaloriasState();
}

class _VitacoraCaloriasState extends State<VitacoraCalorias> {
  @override
  void initState() {
    super.initState();

    // Cargar la lista de alimentos al iniciar la aplicación
    context.read<ListaAlimentos>().cargarLista();
    // Cargar la vista de página al iniciar la aplicación
    context.read<ConsumoDiario>().cargarPageView();
  }

  @override
  Widget build(BuildContext context) {
    // Obtener el valor de los proveedores
    final reset = context.watch<ConsumoDiario>();
    final consumoDiario = context.watch<ConsumoDiario>();
    final pageView = context.read<ConsumoDiario>().checkFirstTime;
    final textTitle = Theme.of(context).textTheme;

    return pageView == false
        // Si checkFirstTime es falso, mostrar PageViewRequisitos
        ? const PageViewRequisitos()
        // De lo contrario, mostrar un Scaffold con la barra de aplicación y el cuerpo
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text(
                'Panel de Consumo',
                style: textTitle.titleLarge,
              ),
              actions: [
                // Botón para mostrar la configuración
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const PageViewRequisitos(),
                      ));
                    },
                    icon: const Icon(Icons.settings)),
                // Botón para restablecer los valores
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
                  ),
                ),
              ],
            ),
            body: SafeArea(
              // Animación al mostrar el cuerpo
              child: ElasticInRight(
                child: Column(
                  children: [
                    // Widget para agregar alimentos
                    ContainerVitacora(
                      onPressedAlimentos: () => setState(() {
                        showDialog(
                          context: context,
                          builder: (context) => const Formulario(),
                        );
                      }),

                      // Widget para agregar registros diarios
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
                    // Lista de alimentos
                    const AlimetLista(),
                  ],
                ),
              ),
            ),
          );
  }
}
