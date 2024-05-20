import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitacora_calorias/domain/data/data.dart';
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
    final textStyle = Theme.of(context).textTheme;

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
                    ? FadeInDownBig(
                        duration: const Duration(milliseconds: 800),
                        child: CardList(
                          listaAlimentos: agregar.listAlimentos,
                          name: alimentos.alimento,
                          onTap: () {
                            setState(() {});
                            consumoDiario.aumentarValores(context,
                                alimentos.proteina, alimentos.calorias);
                          },
                          onDismissed: (DismissDirection direction) {
                            setState(() {
                              agregar.listAlimentos.removeAt(index);
                              agregar.eliminarLista();
                            });
                          }, proteina: alimentos.proteina.toString(), calorias:alimentos.calorias.toString(),
                        ),
                      )
                    : CardList(
                          listaAlimentos: agregar.listAlimentos,
                          name: alimentos.alimento,
                          onTap: () {
                            setState(() {});
                            consumoDiario.aumentarValores(context,
                                alimentos.proteina, alimentos.calorias);
                          },
                          onDismissed: (DismissDirection direction) {
                            setState(() {
                              agregar.listAlimentos.removeAt(index);
                              agregar.eliminarLista();
                            });
                          }, proteina: alimentos.proteina.toString(), calorias:alimentos.calorias.toString(),
                        );
              },
            ),
    );
  }
}

class CardList extends StatelessWidget {
  final List<Alimentos> listaAlimentos;
  final String name;
  final String proteina;
  final String calorias;
  final GestureTapCallback onTap;
  final DismissDirectionCallback onDismissed;
  const CardList(
      {super.key,
      required this.listaAlimentos,
      required this.name,
      required this.onTap,
      required this.onDismissed,
      required this.proteina,
      required this.calorias});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Dismissible(
      key: Key(listaAlimentos.toString()),
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
      onDismissed: onDismissed,
      child: Card(
        color: const Color.fromARGB(246, 249, 249, 249),
        child: ListTile(
          title: Text(
            name,
            style: textStyle.bodyLarge,
          ),
          subtitle: Text('$proteina Proteina'),
          trailing: Text(
            '$calorias Calorias',
            style: textStyle.bodyMedium,
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
