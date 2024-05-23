import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitacora_calorias/domain/dataSources/app_fit_datasources.dart';
import 'package:vitacora_calorias/presentation/screen/view/productos_alimenticios.dart';
import 'package:vitacora_calorias/presentation/screen/view/vitacora_calorias.dart';
import 'package:vitacora_calorias/presentation/widget/shared/botton_navigator.dart';
import 'package:vitacora_calorias/provider/consumo_diario.dart';
import 'package:vitacora_calorias/provider/lista_alimentos.dart';

class HomeScreen extends StatefulWidget {
  final int pageIndex;
  const HomeScreen({super.key, required this.pageIndex});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ListaAlimentos>().cargarLista();
    // Cargar la vista de página al iniciar la aplicación
    context.read<ConsumoDiario>().cargarPageView();
   // context.read<AppFitDataSources>().getFrutasVerduras();
  }

  @override
  Widget build(BuildContext context) {
    final pageView = context.watch<ConsumoDiario>().checkFirstTime;
    const List<Widget> viewRoutes = [
      VitacoraCalorias(),
      ProductosAliment(),
    ];
    return Scaffold(
      body: IndexedStack(
        index: widget.pageIndex,
        children: viewRoutes,
      ),
      bottomNavigationBar: pageView
          ? BottonNavigator(
              pageView: widget.pageIndex,
            )
          : null,
    );
  }
}
