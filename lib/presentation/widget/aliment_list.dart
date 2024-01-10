import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitacora_calorias/provider/consumo_diario.dart';
import 'package:vitacora_calorias/provider/lista_alimentos.dart';

class AlimetLista extends StatefulWidget {
  const AlimetLista({super.key});

  @override
  State<AlimetLista> createState() => _AlimetListaState();
}

class _AlimetListaState extends State<AlimetLista> {
  @override
  Widget build(BuildContext context) {
    final consumoDiario = context.watch<ConsumoDiario>();
    final agregar = context.watch<ListaAlimentos>();
    double subtitle = 13;
    return Expanded(
      // ignore: prefer_is_empty
      child: agregar.listAlimentos.length == 0
          ? const Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Text(
                'Agrega Tus alimentos Favoritos',
                style: TextStyle(color: Colors.black45, fontSize: 18.0),
              ))
          : ListView.builder(
              itemCount: agregar.listAlimentos.length,
              itemBuilder: (BuildContext context, int index) {
                final alimentos = agregar.listAlimentos[index];

                // Aplicar FadeInUp solo al nuevo elemento que se está agregando

                return index == agregar.listAlimentos.length - 1
                    ? Dismissible(
                        key: Key(agregar.listAlimentos.toString()),
                        background: Container(
                          color: Colors.red.shade300,
                          alignment: Alignment.centerLeft,
                          child: const Row(
                            children: [
                              Icon(
                                Icons.delete_forever_outlined,
                                color: Colors.white,
                              ),
                              Text('Eliminar de lista')
                            ],
                          ),
                        ),
                        onDismissed: (direction) {
                          setState(() {
                            agregar.listAlimentos.removeAt(index);
                            agregar.eliminarLista();
                          });
                        },
                        child: FadeInDownBig(
                          duration: const Duration(milliseconds: 500),
                          child: Card(
                            color: const Color.fromARGB(246, 249, 249, 249),
                            child: ListTile(
                              title: Text(alimentos.alimento),
                              subtitle: Text(
                                  '${alimentos.proteina.toString()} Proteina'),
                              trailing: Text(
                                '${alimentos.calorias.toString()} Calorias',
                                style: TextStyle(fontSize: subtitle),
                              ),
                              onTap: () {
                                setState(() {});
                                consumoDiario.aumentarValores(context,
                                    alimentos.proteina, alimentos.calorias);
                              },
                            ),
                          ),
                        ),
                      )
                    : Dismissible(
                        key: Key(agregar.listAlimentos.toString()),
                        background: Container(
                          color: Colors.red.shade300,
                          alignment: Alignment.centerLeft,
                          child: const Row(
                            children: [
                              Icon(
                                Icons.delete_forever_outlined,
                                color: Colors.white,
                              ),
                              Text('Eliminar de lista')
                            ],
                          ),
                        ),
                        onDismissed: (direction) {
                          setState(() {
                            agregar.listAlimentos.removeAt(index);
                            agregar.eliminarLista();
                          });
                        },
                        child: Card(
                          color: const Color.fromARGB(246, 249, 249, 249),
                          child: ListTile(
                            title: Text(alimentos.alimento),
                            subtitle: Text(
                                '${alimentos.proteina.toString()} Proteina'),
                            trailing: Text(
                              '${alimentos.calorias.toString()} Calorias',
                              style: TextStyle(fontSize: subtitle),
                            ),
                            onTap: () {
                              setState(() {});
                              consumoDiario.aumentarValores(context,
                                  alimentos.proteina, alimentos.calorias);
                            },
                          ),
                        ),
                      );
              },
            ),
    );
  }
}
