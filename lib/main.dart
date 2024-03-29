import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitacora_calorias/config/theme/app_theme.dart';
import 'package:vitacora_calorias/presentation/screen/vitacora_calorias.dart';
import 'package:vitacora_calorias/provider/consumo_diario.dart';
import 'package:vitacora_calorias/provider/lista_alimentos.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ConsumoDiario(),
        ),
        ChangeNotifierProvider(
          create: (_) => ListaAlimentos(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const VitacoraCalorias(),
        theme: AppTheme(selectColors: 1).getTheme(),
      ),
    );
  }
}
