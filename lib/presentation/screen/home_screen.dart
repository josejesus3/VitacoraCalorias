import 'package:flutter/material.dart';
import 'package:vitacora_calorias/presentation/screen/view/productos_alimenticios.dart';
import 'package:vitacora_calorias/presentation/screen/view/vitacora_calorias.dart';
import 'package:vitacora_calorias/presentation/widget/shared/botton_navigator.dart';

class HomeScreen extends StatelessWidget {
  final int pageIndex;
  const HomeScreen({super.key, required this.pageIndex});

  @override
  Widget build(BuildContext context) {
    const List<Widget> viewRoutes = [
      VitacoraCalorias(),
      ProductosAlimenticios(),
    ];
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: viewRoutes,
      ),
      bottomNavigationBar: BottonNavigator(
        pageView: pageIndex,
      ),
    );
  }
}
