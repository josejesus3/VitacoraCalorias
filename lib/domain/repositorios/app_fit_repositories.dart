import 'package:vitacora_calorias/infrestuctura/model/frutas_verduras.dart';

abstract class AppFitRepositories {
  Future<List<FrutasVerduras>> getFrutasVerduras();
}
