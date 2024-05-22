import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:vitacora_calorias/domain/entities/api_frutas_verduras.dart';

class AppFitDataSources extends ChangeNotifier {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://appfit.onrender.com/',
  ));

  List<String> responseFrutas = [];
  List<String> responseVerduras = [];

  Future getFrutasVerduras() async {
    final response = await dio.get('FrutasVerduras/get');
    final json = FrutasVerduras.fromJson(response.data);
    responseFrutas = json.frutasVerduras.frutas;
    responseVerduras = json.frutasVerduras.verduras;
    notifyListeners();
  }
}
