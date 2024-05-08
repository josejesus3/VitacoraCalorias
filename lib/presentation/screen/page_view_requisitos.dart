import 'package:flutter/material.dart';
import 'package:vitacora_calorias/presentation/widget/calculadora_calorias.dart';

class PageViewRequisitos extends StatefulWidget {
  const PageViewRequisitos({super.key});

  @override
  State<PageViewRequisitos> createState() => _PageViewRequisitosState();
}

class _PageViewRequisitosState extends State<PageViewRequisitos> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          children: const [
            CalculadorCalorias(),
            CalculadorCalorias(),
          ],
        )
      ],
    );
  }
}
