import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitacora_calorias/domain/dataSources/app_fit_datasources.dart';
import 'package:vitacora_calorias/domain/entities/api_frutas_verduras.dart';
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

  @override
  Widget build(BuildContext context) {
    final frutas = context.watch<AppFitDataSources>().responseJson;
    final agregar = context.watch<ListaAlimentos>();
    final textStyle = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
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
          _FrutasVerduras(
            textStyle: textStyle,
            listaAlimentos: frutas,
          ),
          const Center(
            child: Text("It's rainy here"),
          ),
          const Center(
            child: Text("It's sunny here"),
          ),
        ],
      ),
    );
  }
}

class _FrutasVerduras extends StatelessWidget {
  final TextTheme textStyle;
  final List<Resultado> listaAlimentos;

  const _FrutasVerduras({
    required this.textStyle,
    required this.listaAlimentos,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
        itemCount: listaAlimentos.length,
        itemBuilder: (context, index) {
          final alimentos = listaAlimentos[index];

            print(alimentos.name);
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                width: double.infinity,
                height: 70,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(alimentos.name)),
          );
        },
      ),
    );
  }
}
