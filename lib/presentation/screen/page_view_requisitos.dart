import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vitacora_calorias/presentation/widget/calculadora_calorias.dart';
import 'package:vitacora_calorias/presentation/widget/resultado_personal.dart';

class PageViewRequisitos extends StatefulWidget {
  const PageViewRequisitos({super.key});

  @override
  State<PageViewRequisitos> createState() => _PageViewRequisitosState();
}

class _PageViewRequisitosState extends State<PageViewRequisitos> {
  @override
  Widget build(BuildContext context) {
    PageController _controller = PageController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Requisitos'),
      ),
      body: Stack(
        children: [
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            pageSnapping: false,
            controller: _controller,
            children: [
              ElasticInRight(
                child: CalculadorCalorias(
                  controller: _controller,
                ),
              ),
              ResultadoPersonal(
                controller: _controller,
              ),
            ],
          )
        ],
      ),
    );
  }
}
