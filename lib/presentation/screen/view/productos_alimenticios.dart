import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitacora_calorias/domain/dataSources/app_fit_datasources.dart';
import 'package:vitacora_calorias/provider/lista_alimentos.dart';

class ProductosAliment extends StatelessWidget {
  const ProductosAliment({super.key});

  @override
  Widget build(BuildContext context) {
    final frutas = context.watch<AppFitDataSources>().responseFrutas;
    final verduras = context.watch<AppFitDataSources>().responseVerduras;
    final agregar = context.watch<ListaAlimentos>();
    final textStyle = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '  Frutas',
            style: textStyle.titleLarge,
          ),
          ...frutas.map(
            (frutas) => Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: GestureDetector(
                onTap: (){
                   agregar.agregarAlimentos(frutas, 20,300 );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  width: double.infinity,
                  height: 70,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(frutas),
                ),
              ),
            ),
          ),
          Text(
            '  Verduras',
            style: textStyle.titleLarge,
          ),
          ...verduras.map(
            (verduras) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                width: double.infinity,
                height: 70,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(verduras),
              ),
            ),
          )
        ],
      ),
    );
  }
}
