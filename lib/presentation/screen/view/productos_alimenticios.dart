import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitacora_calorias/domain/dataSources/app_fit_datasources.dart';

class ProductosAliment extends StatelessWidget {
  const ProductosAliment({super.key});

  @override
  Widget build(BuildContext context) {
    final frutas = context.watch<AppFitDataSources>().responseFrutas;
    final verduras = context.watch<AppFitDataSources>().responseVerduras;
    print(frutas);
    return Column(
      children: [
        ...frutas.map(
          (frutas) => SizedBox(
            width: 100,
            height: 100,
            child: Text(frutas),
          ),
        )
      ],
    );
  }
}
