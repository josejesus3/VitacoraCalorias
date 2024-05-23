import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:vitacora_calorias/domain/entities/api_frutas_verduras.dart';
import 'package:vitacora_calorias/domain/entities/api_origen_animal.dart';

class AppFitDataSources extends ChangeNotifier {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://appfit-b328f-default-rtdb.firebaseio.com/',
  ));

  List<Resultado> responseJsonFruVer = [];
  List<Lacteo> responseJsonOriAnimal = [];

  Future getFrutasVerduras() async {
    try {
      final response = await dio.get('Frutas_Verduras.json');
      final json = FrutasVerdurasClass.fromJson(response.data);
      responseJsonFruVer = json.resultado;

      notifyListeners();
    } catch (e) {
      // Manejo de errores, como imprimir el error en la consola
      print('Error al obtener datos: $e');
    }
  }

  Future getOrigenAnimal() async {
    try {
      final response = await dio.get('origenAnimal.json');
      final json = OrigenAnimal.fromJson(response.data);
      responseJsonOriAnimal = json.lacteos;
      notifyListeners();
    } catch (e) {
      print('Error al obtener datos: $e');
    }
  }
}
