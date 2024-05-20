import 'package:vitacora_calorias/domain/entities/api_frutas_verduras.dart';

abstract class AppFitDataSources {
  Future<ApiFrutasVerduras> getFrutasVerduras();
}
