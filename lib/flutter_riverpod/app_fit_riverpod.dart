
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitacora_calorias/infrestuctura/dataSources/app_fit.dart';
import 'package:vitacora_calorias/infrestuctura/repositorios/app_fit_repositories.dart';
final appFitRiverpod=Provider((ref)=>AppFitRepoImpl(datasources: AppFit()));