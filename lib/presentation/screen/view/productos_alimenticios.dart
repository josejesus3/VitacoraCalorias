import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitacora_calorias/domain/dataSources/app_fit_datasources.dart';
import 'package:vitacora_calorias/provider/lista_alimentos.dart';

class ProductosAliment extends StatefulWidget {
  const ProductosAliment({super.key});

  @override
  State<ProductosAliment> createState() => _ProductosAlimentState();
}

class _ProductosAlimentState extends State<ProductosAliment>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final frutas = context.watch<AppFitDataSources>().responseFrutas;
    final verduras = context.watch<AppFitDataSources>().responseVerduras;
    final agregar = context.watch<ListaAlimentos>();
    final textStyle = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              icon: Icon(Icons.cloud_outlined),
            ),
            Tab(
              icon: Icon(Icons.beach_access_sharp),
            ),
            Tab(
              icon: Icon(Icons.brightness_5_sharp),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Center(
            child: _FrutasVerduras(
                textStyle: textStyle,
                frutas: frutas,
                agregar: agregar,
                verduras: verduras),
          ),
          Center(
            child: Text("It's rainy here"),
          ),
          Center(
            child: Text("It's sunny here"),
          ),
        ],
      ),
    );
  }
}

class _FrutasVerduras extends StatelessWidget {
  const _FrutasVerduras({
    super.key,
    required this.textStyle,
    required this.frutas,
    required this.agregar,
    required this.verduras,
  });

  final TextTheme textStyle;
  final List<String> frutas;
  final ListaAlimentos agregar;
  final List<String> verduras;

  @override
  Widget build(BuildContext context) {
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
                onTap: () {
                  agregar.agregarAlimentos(frutas, 20, 300);
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
