import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:vitacora_calorias/domain/entities/api_frutas_verduras.dart';

class AppFitDataSources extends ChangeNotifier {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://appfit.onrender.com/',
  ));

  List<Resultado> responseJson=[];

  Future getFrutasVerduras() async {
    try {
      final response = await dio.get('FrutasVerduras/get');
      final json = FrutasVerduras.fromJson(response.data).frutasVerduras;
      print(json.resultado);
      responseJson = json.resultado;
      
      notifyListeners();
    } catch (e) {
      // Manejo de errores, como imprimir el error en la consola
      print('Error al obtener datos: $e');
    }
  }
}
