import 'package:vitacora_calorias/infrestuctura/model/frutas_verduras.dart';

abstract class AppFitDataSources {
  Future<FrutasVerduras> getFrutasVerduras();
}
