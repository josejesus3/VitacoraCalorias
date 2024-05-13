import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitacora_calorias/provider/consumo_diario.dart';

class AlertDialogCustom extends StatelessWidget {
  const AlertDialogCustom({super.key});

  @override
  Widget build(BuildContext context) {
    final alert = context.read<ConsumoDiario>();
    final TextEditingController proteinasController = TextEditingController();
    final TextEditingController caloriasController = TextEditingController();
    return AlertDialog(
      title: const Text('Ajustar dieta'),
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
          onPressed: () {
            // Agregar lógica para validar y agregar a la lista

            final int proteinas = int.tryParse(proteinasController.text) ?? 0;
            final int calorias = int.tryParse(caloriasController.text) ?? 0;

            // Validar y agregar a la lista
            if (proteinas <= 0 || proteinas > 500) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                      'Proteina debe permanecer en estos valores 1 y 130')));
            } else if (calorias <= 0 || calorias > 5000) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                      'Calorias debe permanecer en estos valores 1 y 3000')));
            } else {
              alert.metaAlcanzar(proteinas, 2000.0, true);
              Navigator.of(context).pop();
            }
          },
          child: const Text('Aceptar'),
        ),
      ],
    );
  }
}
