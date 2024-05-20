import 'package:dio/dio.dart';
import 'package:vitacora_calorias/domain/dataSources/app_fit_datasources.dart';
import 'package:vitacora_calorias/domain/entities/api_frutas_verduras.dart';
import 'package:vitacora_calorias/infrestuctura/mapper/api_mapper.dart';
import 'package:vitacora_calorias/infrestuctura/model/frutas_verduras.dart';

class AppFit extends AppFitDataSources {
  final dio = Dio(BaseOptions(baseUrl: 'https://appfit.onrender.com/'));

  @override
  Future<ApiFrutasVerduras> getFrutasVerduras() async {
    final response = await dio.get('frutasVerduras/get');
    final json = FrutasVerduras.fromJson(response.data).frutasVerduras;

    final ApiFrutasVerduras getFrutasVerduras =
        ApiMapper.frutasVerdurasMapper(json);

    return getFrutasVerduras;
  }
}
