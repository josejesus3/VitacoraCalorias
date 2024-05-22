// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitacora_calorias/provider/consumo_diario.dart';
import 'package:vitacora_calorias/provider/lista_alimentos.dart';

class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  @override
  Widget build(BuildContext context) {
    final consumoDiario = context.watch<ConsumoDiario>();
    final agregar = context.watch<ListaAlimentos>();
    final TextEditingController nombreController = TextEditingController();
    final TextEditingController proteinasController = TextEditingController();
    final TextEditingController caloriasController = TextEditingController();
    return AlertDialog(
      title: const Text('Alimento Nuevo'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: nombreController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: 'Nombre alimento',
              ),
            ),
            TextField(
              controller: proteinasController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Proteínas',
              ),
            ),
            TextField(
              controller: caloriasController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Calorías',
              ),
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () {
            // Agregar lógica para validar y agregar a la lista
            final String nombre = nombreController.text;
            final int proteinas = int.tryParse(proteinasController.text) ?? 0;
            final int calorias = int.tryParse(caloriasController.text) ?? 0;

            // Validar y agregar a la lista
            if (nombre.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Nombre no debe estar vacio')));
            } else if (proteinas <= 0 ||
                proteinas > consumoDiario.proteinaAlcanzar) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                      'Proteina debe permanecer en estos valores 1 y ${consumoDiario.proteinaAlcanzar}')));
            } else if (calorias <= 0 ||
                calorias > consumoDiario.caloriasAlcanzar) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                      'Calorias debe permanecer en estos valores 1 y ${consumoDiario.caloriasAlcanzar}')));
            } else {
              agregar.agregarAlimentos(nombre, proteinas, calorias);
              Navigator.of(context).pop();
            }
          },
          child: const Text('Agregar'),
        ),
      ],
    );
  }
}

class FormularioDiario extends StatelessWidget {
  const FormularioDiario({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final consumoDiario = context.watch<ConsumoDiario>();
    final TextEditingController proteinasController = TextEditingController();
    final TextEditingController caloriasController = TextEditingController();

    return AlertDialog(
      title: const Text('Consumo Diario'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: proteinasController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Proteínas',
              ),
            ),
            TextField(
              controller: caloriasController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Kilocalorías',
              ),
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Salir'),
        ),
        ElevatedButton(
          onPressed: () {
            // Agregar lógica para validar y agregar a la lista

            final int proteinas = int.tryParse(proteinasController.text) ?? 0;
            final int calorias = int.tryParse(caloriasController.text) ?? 0;

            // Validar y agregar a la lista
            if (proteinas <= 0 || proteinas > consumoDiario.proteinaAlcanzar) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                      'Proteina debe permanecer en estos valores 1 y ${consumoDiario.proteinaAlcanzar}')));
            } else if (calorias <= 0 ||
                calorias > consumoDiario.caloriasAlcanzar) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                      'Calorias debe permanecer en estos valores 1 y ${consumoDiario.caloriasAlcanzar}')));
            } else {
              consumoDiario.aumentarValores(context, proteinas, calorias);
              Navigator.of(context).pop();
            }
          },
          child: const Text('Agregar'),
        ),
      ],
    );
  }
}
