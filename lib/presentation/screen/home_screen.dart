import 'package:flutter/material.dart';
import 'package:vitacora_calorias/presentation/screen/view/page_view_requisitos.dart';
import 'package:vitacora_calorias/presentation/screen/view/vitacora_calorias.dart';
import 'package:vitacora_calorias/presentation/widget/shared/botton_navigator.dart';

class HomeScreen extends StatelessWidget {
  final int pageIndex;
  const HomeScreen({super.key, required this.pageIndex});

  @override
  Widget build(BuildContext context) {
    const List<Widget> viewRoutes = [
      VitacoraCalorias(),
      PageViewRequisitos(),
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
