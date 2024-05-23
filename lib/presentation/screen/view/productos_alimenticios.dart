import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitacora_calorias/domain/dataSources/app_fit_datasources.dart';
import 'package:vitacora_calorias/provider/provider.dart';

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
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final frutas = context.watch<AppFitDataSources>().responseJsonFruVer;
    final origenAnimal =
        context.watch<AppFitDataSources>().responseJsonOriAnimal;
    final agregar = context.watch<ListaAlimentos>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottom: TabBar(
          tabAlignment: TabAlignment.start,
          isScrollable: true,
          controller: _tabController,
          tabs: const [
            Tab(
              text: 'Frutas y Verduras',
            ),
            Tab(
              text: 'Cereales',
            ),
            Tab(
              text: 'Frutos secos',
            ),
            Tab(
              text: 'Origen Animal',
            ),
            Tab(
              text: 'Suplementos',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          _ListaAlimentos(listaAlimentos: frutas),
          const Center(
            child: Text("It's rainy here"),
          ),
          const Center(
            child: const Text("It's sunny here"),
          ),
          _ListaAlimentos(listaAlimentos: origenAnimal),
          const Center(
            child: Text("It's rainy here"),
          ),
        ],
      ),
    );
  }
}

class _ListaAlimentos extends StatelessWidget {
  final List<dynamic> listaAlimentos;

  const _ListaAlimentos({
    required this.listaAlimentos,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final agregar = context.watch<ListaAlimentos>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
        itemCount: listaAlimentos.length,
        itemBuilder: (context, index) {
          final alimentos = listaAlimentos[index];

          return GestureDetector(
            onTap: () {
              agregar.agregarAlimentos(
                  alimentos.producto, alimentos.proteinas, alimentos.calorias);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                title: Text(
                  alimentos.producto,
                  style: textStyle.bodyLarge,
                ),
                subtitle: Text(
                    ' ${alimentos.proteinas.toString()} P/${alimentos.calorias.toString()} kcal'),
                trailing: Image.asset(
                  'assets/alimentos.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
