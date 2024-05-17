import 'package:dio/dio.dart';
import 'package:vitacora_calorias/domain/dataSources/app_fit_datasources.dart';
import 'package:vitacora_calorias/infrestuctura/model/frutas_verduras.dart';

void main() {
  final nuevoObjeto = AppFit();
  print(nuevoObjeto.getFrutasVerduras());
}

class AppFit extends AppFitDataSources {
  final dio = Dio(BaseOptions(baseUrl: 'https://appfit.onrender.com/'));

  @override
  Future<FrutasVerduras> getFrutasVerduras() async {
    final response = await dio.get('frutasVerduras/get');
    final getFrutasVerduras = FrutasVerduras.fromJson(response.data);
    print(getFrutasVerduras.frutasVerduras.frutas);
    return getFrutasVerduras;
  }
}
