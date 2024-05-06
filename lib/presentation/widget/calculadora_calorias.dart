import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CalculadorCalorias extends StatelessWidget {
  const CalculadorCalorias({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(148, 56, 142, 60),
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(50)),
                  child: const Icon(Icons.person_2_outlined),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(50)),
                  child: const Icon(Icons.person_3_outlined),
                ),
              ),
              const Spacer()
            ],
          ),
          const _FormularioRegistro()
        ],
      ),
    );
  }
}

class _FormularioRegistro extends StatelessWidget {
  final TextEditingController? textContrller;
  final String nombreCampo;
  const _FormularioRegistro({
    super.key,
    this.textContrller,
    required this.nombreCampo,
  });

  @override
  Widget build(BuildContext context) {
    return TextField();
  }
}
