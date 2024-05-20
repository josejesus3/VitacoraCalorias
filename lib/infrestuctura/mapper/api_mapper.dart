import 'package:vitacora_calorias/domain/entities/api_frutas_verduras.dart';
import 'package:vitacora_calorias/infrestuctura/model/frutas_verduras.dart';

class ApiMapper {
  static ApiFrutasVerduras frutasVerdurasMapper(FrutasVerdurasClass response) =>
      ApiFrutasVerduras(frutas: response.frutas, verduras: response.verduras);
}
