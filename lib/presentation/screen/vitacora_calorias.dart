// ignore_for_file: prefer_is_empty

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitacora_calorias/presentation/screen/page_view_requisitos.dart';
import 'package:vitacora_calorias/presentation/widget/aliment_list.dart';
import 'package:vitacora_calorias/provider/consumo_diario.dart';
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
    context.read<ConsumoDiario>().cargarPageView();
  }

  @override
  Widget build(BuildContext context) {
    // Llamar a alertDialog solo en el método build
    final reset = context.watch<ConsumoDiario>();
    final consumoDiario = context.watch<ConsumoDiario>();
    final pageView = context.read<ConsumoDiario>().checkFirstTime;
    final textTitle = Theme.of(context).textTheme;

    return pageView == false
        ? const PageViewRequisitos()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text(
                'Panel de Alimentacion',
                style: textTitle.titleLarge,
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const PageViewRequisitos(),
                      ));
                    },
                    icon: const Icon(Icons.settings)),
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
              child: ElasticInRight(
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
            ),
          );
  }
}
