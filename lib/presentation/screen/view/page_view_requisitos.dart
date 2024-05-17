// Importación del paquete de animaciones
import 'package:animate_do/animate_do.dart';
// Importación del paquete de widgets de Flutter
import 'package:flutter/material.dart';
// Importación de widgets locales
import 'package:vitacora_calorias/presentation/widget/calculadora_calorias.dart';
import 'package:vitacora_calorias/presentation/widget/resultado_personal.dart';

// Clase StatefulWidget para la vista de PageViewRequisitos
class PageViewRequisitos extends StatefulWidget {
  const PageViewRequisitos({super.key});

  @override
  State<PageViewRequisitos> createState() => _PageViewRequisitosState();
}

// Estado de PageViewRequisitos
class _PageViewRequisitosState extends State<PageViewRequisitos> {
  @override
  Widget build(BuildContext context) {
    // Controlador de la página
    PageController controller = PageController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Requisitos'), // Título de la barra de aplicación
      ),
      body: Stack(
        children: [
          // Vista de PageView con dos páginas
          PageView(
            physics:
                const NeverScrollableScrollPhysics(), // Desactivar desplazamiento
            pageSnapping: false, // Desactivar ajuste de página
            controller: controller, // Controlador de la página
            children: [
              ElasticInRight(
                child: CalculadorCalorias(
                  controller:
                      controller, // Pasar el controlador a la CalculadoraCalorias
                ),
              ),
              ResultadoPersonal(
                controller:
                    controller, // Pasar el controlador a ResultadoPersonal
              ),
            ],
          )
        ],
      ),
    );
  }
}
