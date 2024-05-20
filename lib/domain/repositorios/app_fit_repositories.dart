import 'package:vitacora_calorias/domain/entities/api_frutas_verduras.dart';

abstract class AppFitRepositories {
  Future<ApiFrutasVerduras> getFrutasVerduras();
}
