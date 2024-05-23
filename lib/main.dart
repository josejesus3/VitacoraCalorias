import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:vitacora_calorias/config/router/app_router.dart';
import 'package:vitacora_calorias/config/theme/app_theme.dart';
import 'package:vitacora_calorias/domain/dataSources/app_fit_datasources.dart';
import 'package:vitacora_calorias/provider/formula.dart';
import 'package:vitacora_calorias/provider/consumo_diario.dart';
import 'package:vitacora_calorias/provider/lista_alimentos.dart';
import 'package:vitacora_calorias/provider/provider_globales.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

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
        ChangeNotifierProvider(
          create: (_) => ProviderGlobales(),
        ),
        ChangeNotifierProvider(
          create: (_) => FormulaProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AppFitDataSources(),
        )
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter,
        theme: AppTheme(selectColors: 4).getTheme(),
      ),
    );
  }
}
