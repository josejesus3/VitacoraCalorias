import 'package:vitacora_calorias/domain/dataSources/app_fit_datasources.dart';
import 'package:vitacora_calorias/domain/entities/api_frutas_verduras.dart';
import 'package:vitacora_calorias/domain/repositorios/app_fit_repositories.dart';


class AppFitRepoImpl extends AppFitRepositories {
  final AppFitDataSources datasources;
  AppFitRepoImpl({required this.datasources});
  @override
  Future<ApiFrutasVerduras> getFrutasVerduras() {
    return datasources.getFrutasVerduras();
  }
}
